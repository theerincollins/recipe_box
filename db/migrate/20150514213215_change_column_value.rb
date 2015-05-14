class ChangeColumnValue < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.change(:rating, :string)
    end
  end
end
