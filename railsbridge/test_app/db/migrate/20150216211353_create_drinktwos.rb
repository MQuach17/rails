class CreateDrinktwos < ActiveRecord::Migration
  def change
    create_table :drinktwos do |t|
      t.string :name
      t.integer :temperature

      t.timestamps null: false
    end
  end
end
