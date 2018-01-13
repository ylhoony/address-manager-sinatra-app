class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso_2
      t.string :iso_3
      t.string :iso_numeric_3
    end
  end
end
