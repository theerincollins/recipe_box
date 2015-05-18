class AddTimeIntervalsToRecipes < ActiveRecord::Migration
  def change
    add_column(:recipes, :prep_time, :interval)
    add_column(:recipes, :cook_time, :interval)
    add_column(:recipes, :total_time, :interval)
  end
end
