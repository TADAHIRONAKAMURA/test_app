class ChangeDatatypeWeatherOfFishingReports < ActiveRecord::Migration[5.2]
  def change
  	change_column :fishing_reports, :weather, :integer
  end
end
