class CreatePhotos < ActiveRecord::Migration[5.2]
  	def change
    	create_table :photos do |t|
    	t.integer :fishing_report_id, :null => false
		t.string :photo_image_id
     	t.timestamps
    	end
  	end
end
