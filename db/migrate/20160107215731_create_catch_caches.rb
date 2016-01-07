class CreateCatchCaches < ActiveRecord::Migration
  def change
    create_table :catch_caches do |t|
      t.integer :fish_id
      t.integer :count
      t.integer :catchable_id
      t.string :catchable_type
      t.string :weight
      t.string :length

      t.timestamps null: false
    end
  end
end
