class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.text :comennt
    	t.integer :user_id
    	t.integer :fishing_report_id, :null => false
      t.timestamps
    end
  end
end
