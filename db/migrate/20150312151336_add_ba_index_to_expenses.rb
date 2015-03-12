class AddBaIndexToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :ba_index, :integer
  end
end
