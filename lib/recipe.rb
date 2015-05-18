class Recipe < ActiveRecord::Base

  has_and_belongs_to_many(:ingredients)

  validates(:title, :presence => true)
  validates(:instructions, :presence => true)

  has_and_belongs_to_many(:categories)

  belongs_to(:rating)

  before_save(:total_time)

def total_time
  self.total_time = self.prep_time.to_i + self.cook_time.to_i
end

end
