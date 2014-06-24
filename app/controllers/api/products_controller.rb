class Api::ProductsController < ApplicationController
	def vote_by
		user = User.find(params[:user_id]) rescue (raise ActiveRecord::RecordNotFound)
		product = Product.find(params[:product_id]) rescue (raise ActiveRecord::RecordNotFound)
		if params[:vote] == "up"
			product.liked_by user
		else
			product.downvote_from user			
		end
		render json: {success: true, message: 'Successfully liked!', total_votes: (product.get_upvotes.size - product.get_downvotes.size), is_liked: params[:vote]}
	rescue Exception => e
		render json: {success: false, message: e.message}
	end
end
