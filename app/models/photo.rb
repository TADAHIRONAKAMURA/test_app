class Photo < ApplicationRecord

# 	# belongs_to	:fishing_report
# 	attachment :photo_image



# 	def self.create_photos_by(photo_params)

# 	# /* そもそも一枚も上がってきてない時のためのvalidate */
# 	return false if photo_params[:content].nil?

# 	# /* 途中でエラった時にRollbackするようにTransaction */
# 	Photo.transaction do 
# # 
# 	/* アップロードされた画像を一枚ずつ処理 */
# 	photo_params[:content].each do |photo|
# 	  new_photo = Photo.new(photo_image: photo_params[:photo_image], content: photo)
# 	  return false unless new_photo.save!
# 	end
# 	end

# 	true
# 	end

end
