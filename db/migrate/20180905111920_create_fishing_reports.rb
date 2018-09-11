class CreateFishingReports < ActiveRecord::Migration[5.2]
  	def change
    	create_table :fishing_reports do |t|
    		t.integer :user_id, :null => false
			t.integer :fishing_spot_id, :null => false
			t.date :fishing_date, :null => false
			t.index :fishing_date
			t.string :time, :null => false
			t.string :weather, :null => false
			t.integer :size, :null => false
			t.integer :lure_type_id, :null => false
			t.string :lure_name, :null => false
			t.string :range, :null => false
			t.string :retrieve, :null => false
			t.text :fishing_body, :null => false
			t.timestamps
    	end
  end
end