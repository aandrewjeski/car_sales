class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :manufacturer, null: false
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
    end
  end
end
