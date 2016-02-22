class CreateCatchMethods < ActiveRecord::Migration
  def change
    create_table :catch_methods do |t|
      t.string :name
      t.string :fishing_type

      t.timestamps null: false
    end
  end
end
