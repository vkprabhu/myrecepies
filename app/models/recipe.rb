class Recipe < ActiveRecord::Base
    belongs_to :chef
    validates :name, presence: true, length: { minimum: 5 , maximum: 100 } #validates_presence_of :name
    validates :summary, presence: true, length: { minimum: 10 , maximum: 150 } #validates_presence_of :summary
    validates :description, presence: true, length: { minimum: 20 , maximum: 500 }
end
