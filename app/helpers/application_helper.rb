module ApplicationHelper
	def users_nav_links
		_nav = ["<ul class='nav navbar-nav customized-nav'>"]
        _nav << "<li class='dropdown #{'active' if controller_name == 'products' && action_name == 'show'}'>"
		#_nav << "<li class=#{'active' if controller_name == 'products'}><a href='/products'>Products</a></li>" if only_admin
        	_nav << "<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Categories <b class='caret'></b></a>"
			_nav << "<ul class='dropdown-menu'>"
			Category.all.each do |category|
				_nav << "<li><a href='/products?c=#{category.name.downcase}'>#{category.name.titlecase rescue ''}</a></li>"
			end
			_nav << "</ul></li>"
        _nav << "<li class=#{'active' if controller_name == 'sort'}><a href='#sort'>Sort</a></li>"
        _nav << "<li class=#{'active' if controller_name == 'sell'}><a href='/products'>Sell</a></li>"
        _nav << "<li class=#{'active' if controller_name == 'wishlist'}><a href='#wishlist'>Wishlist</a></li>"
        _nav << "</ul>"
		_nav << "<ul class='nav navbar-nav navbar-right'>"
        if user_signed_in?
          _nav << "<li><a href='/user/profile'>Profile</a></li>"
          _nav << "<li><a href='#{destroy_user_session_path}' data-method='delete'>Logout</a></li>"
        else
          _nav << "<li class='ln-right'><a href='/users/sign_in'>SIGN IN</a></li>"
          _nav << "<li class='ln-left'><a href='/users/sign_up'>REGISTER</a></li>"
        end
        _nav << "</ul>"
		_nav.join().html_safe
	end

	def only_admin
		return true if user_signed_in? && current_user.is_admin
		return false
	end

	def escapeHTML content
		c = content.gsub("'","&#39;")
		return c.gsub('"','&#34;')
	end

	def dv_all_categories
		_div = []
		Category.all.each do |category|
			_div << "<a href='/products?c=#{category.name.downcase}'>#{category.name}</a>"
		end
		_div.join("&nbsp  |  &nbsp").html_safe
	end

end