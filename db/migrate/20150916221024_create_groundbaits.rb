class CreateGroundbaits < ActiveRecord::Migration
  def change
    create_table :groundbaits do |t|
      t.string :color
      t.string :groundbait_type
      t.string :taste

      t.timestamps null: false
    end
  end
end
