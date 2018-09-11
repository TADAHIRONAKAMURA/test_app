class AddAPhotoIdToFishingReports < ActiveRecord::Migration[5.2]
  def change
    add_column :fishing_reports, :a_photo_id, :string, array: true
    serialize :fishing_reports, Array
  end
end

