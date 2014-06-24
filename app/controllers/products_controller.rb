class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :validate_admin_user, only: [:edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if !params[:q].nil?
      @products = Product.includes(:categories).where("LOWER(categories.name) like '%#{params[:q].to_s.downcase}%' OR LOWER(products.name) like '%#{params[:q].to_s.downcase}%'")
    elsif !params[:c].nil?
      @products = Product.includes(:categories).where("LOWER(categories.name) like '%#{params[:c].to_s.downcase}%'").references(:categories)
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find_by_slug(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.category_ids = params[:product][:category_ids]
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    @product.category_ids = params[:product][:category_ids]
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :image, :link, :desc)
    end
end
