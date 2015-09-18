class CreateExpeditionFishes < ActiveRecord::Migration
  def change
    create_table :expedition_fishes do |t|
      t.integer :fish_id
      t.integer :expedition_id
      t.integer :length
      t.integer :weight
      t.integer :bat_id
      t.text :notes

      t.timestamps null: false
    end
  end
end
