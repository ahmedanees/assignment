class CreateThermostats < ActiveRecord::Migration[5.2]
  def change
    create_table :thermostats, id: :uuid do |t|
      t.string :household_token
      t.string :location

      t.timestamps
    end
  end
end
