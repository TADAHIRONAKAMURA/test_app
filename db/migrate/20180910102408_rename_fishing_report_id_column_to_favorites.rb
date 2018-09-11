class RenameFishingReportIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :favorite_id, :fishing_report_id
  end
end
