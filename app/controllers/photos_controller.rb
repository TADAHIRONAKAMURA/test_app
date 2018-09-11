class PhotosController < ApplicationController
	def photo_params
  		params.require(:photo).permit( :photo_image, {content: []})
	end

end
