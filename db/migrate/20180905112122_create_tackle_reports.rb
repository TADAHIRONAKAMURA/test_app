class CreateTackleReports < ActiveRecord::Migration[5.2]
  	def change
    	create_table :tackle_reports do |t|
    		t.integer :user_id
			t.string :tackle_image_id, :null => false
			t.string :evaluation, :null => false
			t.string :maker_id, :null => false
			t.string :lure_type_id, :null => false
			t.string :tackle_name, :null => false
			t.string :tackle_body, :null => false
      	t.timestamps
    	end
  end
end
