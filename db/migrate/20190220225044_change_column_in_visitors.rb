class ChangeColumnInVisitors < ActiveRecord::Migration[5.2]
  def change
  	change_column :visitors, :user_id, :integer
  	change_column :visitors, :shortened_url_id, :integer
  end
end
