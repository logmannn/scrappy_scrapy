class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.timestamps
    end
    create_table(:brands_stores) do |t|
      t.column(:store_id, :integer)
      t.column(:brand_id, :integer)
     end
    create_table(:brands) do |t|
      t.column(:name, :string)
      t.timestamps
    end
    create_table(:brands_items) do |t|
      t.column(:item_id, :integer)
      t.column(:brand_id, :integer)
     end
    create_table(:items) do |t|
      t.column(:name, :string)
      t.column(:price, :float)
      t.timestamps
    end
  end
end
