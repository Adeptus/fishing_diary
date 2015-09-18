class CreateBaitTypes < ActiveRecord::Migration
  def change
    create_table :bait_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
