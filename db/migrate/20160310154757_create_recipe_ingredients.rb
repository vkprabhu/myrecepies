class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id, :ingredient_id
      t.timestamps null: false
    end
  end
end
