class CreateRatingsTable < ActiveRecord::Migration
  def change
    create_table(:ratings) do |t|
      t.column(:rating, :integer)
    end
  end
end
