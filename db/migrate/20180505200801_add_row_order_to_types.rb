class AddRowOrderToTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :types, :row_order, :integer
  end
end
