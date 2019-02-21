class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
    	t.integer :user_id
    	t.integer :shortened_url_id
    	t.timestamps
    end

    add_index :visitors, :user_id
    add_index :visitors, :shortened_url_id
  end
end
