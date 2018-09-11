class FavoritesController < ApplicationController
	def create
		@f_report = FishingReport.find(params[:fishing_report_id])
        favorite = current_user.favorites.new(fishing_report_id: @f_report.id)
        favorite.save
        redirect_to fishing_report_path(@f_report)
    end
    def destroy
    	@f_report = FishingReport.find(params[:fishing_report_id])
    	favorite = current_user.favorites.find_by(fishing_report_id: @f_report.id)
        p "------"
        p favorite
        p "------"
    	favorite.destroy
    	redirect_to fishing_report_path(@f_report)
    end









end


# class FavoritesController < ApplicationController
#         def create
#             post_image = PostImage.find(params[:post_image_id])
#             favorite = current_user.favorites.new(post_image_id: post_image.id)
#             favorite.save
#             redirect_to post_image_path(post_image)
#         end
#         def destroy
#             post_image = PostImage.find(params[:post_image_id])
#             favorite = current_user.favorites.find_by(post_image_id: post_image.id)
#             favorite.destroy
#             redirect_to post_image_path(post_image)
#         end
# end
# 	def create
# 		@item = Item.find(params[:item_id])
# 		@like = current_user.likes.new(item_id: @item.id)
# 		@like.save
# 		# redirect_to item_path(@item)
# 		@item.reload
# 		respond_to do |format|
#   	      format.html { render @item }
#   	      format.js
#   	    end
# 	end
# 	def destroy
# 		@item = Item.find(params[:item_id])
# 		@like = current_user.likes.find_by(item_id: params[:item_id])
# 		@like.destroy
# 		# redirect_to item_path(@item)
# 		@item.reload
# 		respond_to do |format|
#   	      format.html { render @item }
#   	      format.js
#   	    end
# 	end