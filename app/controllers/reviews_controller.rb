class ReviewsController < ApplicationController

	# 	def create
	# 	@item = Item.find(params[:item_id])
	# 	@review = current_user.reviews.new(review_params)
	# 	@review.item_id = @item.id
	# 	if @review.save
	# 		redirect_to item_path(@item)
	# 	else
	# 		@items = Item.all
	# 		# 別のコントローラーアクションにrenderする場合アクションに記入されているの変数を持ってこないといけない
	# 		@review = Review.new
	# 		@artists = Artist.all
	# 		@genres = Genre.all
	# 		@labels = Label.all
	# 		@disks = Disk.all
	# 		@songs = Song.all
	# 		@cart_item =CartItem.new
	# 		@likes = Like.all
	# 		@rank = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(10).pluck(:item_id))			
	# 		flash.now[:notice] = "100文字以内で投稿してください"
	# 		render :template => 'items/show'
	# 	end
	# end

	# def destroy
	# 	@review = Review.find_by(item_id: params[:item_id], id: params[:id])
	# 	@review.destroy
	# 	redirect_to item_path(params[:item_id])
	# end

	# private
	# def review_params
	# 	params.require(:review).permit(:user_id, :item_id, :comment)		
	# end

	def create
		@f_report = FishingReport.find(params[:fishing_report_id])
		@review = current_user.reviews.new(review_params)
		@review.fishing_report_id = @f_report.id
		@review.save
		redirect_to fishing_report_path(@f_report)
	end

		# def destroy
	# 	@review = Review.find_by(fishing_report_id: params[:fishing_report_id], id: params[:id])
	# 	@review.destroy
	# 	redirect_to fishing_report_path(params[:fishing_report_id])
	# end

	private
	def review_params
  	params.require(:review).permit(:user_id, :fishing_report_id, :comennt)
	end

end

