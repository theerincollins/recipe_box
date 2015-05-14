class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)

  validates(:description, :presence => true)

  belongs_to(:type)

end
