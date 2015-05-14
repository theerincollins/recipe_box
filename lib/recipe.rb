class Recipe < ActiveRecord::Base

  has_and_belongs_to_many(:ingredients)

  validates(:title, :presence => true)
  validates(:instructions, :presence => true)

  has_and_belongs_to_many(:categories)

  belongs_to(:rating)

end
