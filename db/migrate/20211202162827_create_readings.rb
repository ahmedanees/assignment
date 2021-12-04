class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings, id: :uuid do |t|
    
      t.references :thermostat, foreign_key: true, type: :uuid

      t.integer :number
      t.decimal :temperature, precision: 8, scale: 2
      t.decimal :humidity, precision: 8, scale: 2
      t.decimal :battery_charge, precision: 8, scale: 2

      t.timestamps
    end
  end
end
