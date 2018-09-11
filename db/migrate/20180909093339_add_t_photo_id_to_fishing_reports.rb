class AddTPhotoIdToFishingReports < ActiveRecord::Migration[5.2]
  def change
    add_column :fishing_reports, :T_photo_id, :string
  end
end
