class UsersController < ApplicationController
	def index
		@users = User.all
		@user = current_user
	end
	
	# def follow
	# 	user = User.find(params[:id])
	# 	if current_user.folloing?(user)
	# 		current_user.unfollow!(user)
	# 	else
	# 		current_user.follow!(user)
	# 	end
	# 	render partial: 'user', locals: {user: user}
	# end

	# def count
	# 	render partial:current_user.followed_users
	# end

	# def tmp
	# 	if params[:dotti] == "follow"
	# 		user =User.find(params[:dareno])
	# 		render partial: 'follow', locals: {fort: user.followed_users, a: user.nickname, b: params[:dotti]}
	# 	else
	# 		user = User.find(params[:dareno])
	# 		render partial: 'follow', locals: {fort: user.followers, a: user.nickname, b: params[:dotti]}
	# 	end
	# end

	# def count
 #    render json: current_user.followed_users.count
 #  	end

	def admin_index
		@users = User.all
	end

	def new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if admin_signed_in?
			@user.update(user_params)
		elsif user_signed_in?
			if @user.id == current_user.id
		   		@user.update(user_params)
		   	    redirect_to users_path
		    else
		   	    redirect_to fishing_spots_path
		    end  	
	     else
	      	redirect_to fishing_spots_path 
	   	end
  	end
   def destroy
		user = User.find(params[:id])
    	if admin_signed_in?
      	user.destroy
      	redirect_to users_path
    	else
      		if user_signed_in?
        		user.destroy
        		redirect_to root_path
      		else
        		redirect_to new_user_session_path
      		end
    	end
	end
	def user_params
		params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:phone_number,:email,:artist_id,:nickname, :introduction)
	end
end

# t.boolean "is_exist?"
