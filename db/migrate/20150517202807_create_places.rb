class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :place_type
      t.string :name
      t.text :notes
      t.text :address

      t.timestamps null: false
    end
  end
end
