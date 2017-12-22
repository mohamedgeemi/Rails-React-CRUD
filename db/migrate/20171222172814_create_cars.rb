class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :horsepower
      t.integer :price
      t.string :model

      t.timestamps
    end
  end
end
