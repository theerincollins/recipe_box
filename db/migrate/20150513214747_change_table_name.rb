class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table(:ingredient_types, :types)
  end
end
