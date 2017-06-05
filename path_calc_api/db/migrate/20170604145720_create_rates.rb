class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :name
      t.string :name_ru
      t.integer :delivery_cost
      t.integer :minimum_cost
      t.integer :minute_cost
      t.integer :km_cost

      t.timestamps null: false
    end
  end
end
