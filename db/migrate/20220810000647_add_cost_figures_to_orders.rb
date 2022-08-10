class AddCostFiguresToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :sub_total, :decimal, precision: 9, scale: 2 
    add_column :orders, :tax, :decimal, precision: 9, scale: 2
    add_column :orders, :total, :decimal, precision: 9, scale: 2
  end
end
