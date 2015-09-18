class CreateExpeditions < ActiveRecord::Migration
  def change
    create_table :expeditions do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :place_id
      t.text :notes
      t.string :pressure
      t.string :showers
      t.string :overcast
      t.integer :temperature

      t.timestamps null: false
    end
  end
end
