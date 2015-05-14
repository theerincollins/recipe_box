class Rating < ActiveRecord::Base
  has_many(:recipes)

  OneStar = Rating.create(rating: "One Star")
end
