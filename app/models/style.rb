class Style < ActiveRecord::Base
    #validate :name, presence: true, length: { minimum: 2, maximum: 25 }
    has_many :recipe_styles
    has_many :recipes, through: :recipe_styles
end
