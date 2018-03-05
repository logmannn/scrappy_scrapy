class AddPricing < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :price, :float
  end
end
