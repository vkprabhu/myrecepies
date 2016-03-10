class CreateRecipeStyles < ActiveRecord::Migration
  def change
    create_table :recipe_styles do |t|
      t.integer :recipe_id
      t.integer :style_id
      t.timestamps null: false
    end
  end
end
