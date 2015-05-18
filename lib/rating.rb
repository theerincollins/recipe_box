class Rating < ActiveRecord::Base
  has_many(:recipes)

end
