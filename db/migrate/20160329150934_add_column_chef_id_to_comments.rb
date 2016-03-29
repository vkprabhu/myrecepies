class AddColumnChefIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :chef_id, :integer
  end
end
