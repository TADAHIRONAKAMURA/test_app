class AddFPhotoIdToFishingReports < ActiveRecord::Migration[5.2]
  def change
    add_column :fishing_reports, :f_photo_id, :string
  end
end
