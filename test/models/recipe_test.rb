require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @recipe = Recipe.new(name: "Chicken", summary: "sdjsdsjdjd", description: "ashdssdhgsahdgsvd")
  end
  
  test "data valid?" do
    assert @recipe.valid?
  end
end
