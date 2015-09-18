class CreateBaits < ActiveRecord::Migration
  def change
    create_table :baits do |t|
      t.integer :producer_id
      t.string :taste
      t.string :color
      t.integer :size
      t.integer :bait_type_id
      t.string :shape

      t.timestamps null: false
    end
  end
end
