class AddColumnPasswordDigestToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :password_digest, :string
  end
end
