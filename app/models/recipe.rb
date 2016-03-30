class Recipe < ActiveRecord::Base
    belongs_to :chef
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :recipe_styles, dependent: :destroy
    has_many :styles, through: :recipe_styles
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    validates :chef_id, presence: true
    validates :name, presence: true, length: { minimum: 5 , maximum: 100 } #validates_presence_of :name
    validates :summary, presence: true, length: { minimum: 10 , maximum: 150 } #validates_presence_of :summary
    validates :description, presence: true, length: { minimum: 20 , maximum: 500 }
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    def thumbs_up_total
        self.likes.where('like= ?', true).length
    end
    
    def thumbs_down_total
        self.likes.where('like= ?', false).length
    end
    
    private
    def picture_size
        if picture.size > 5.megabytes
            errors.add(:picture, "should be less than 5MB")
        end
    end
end
