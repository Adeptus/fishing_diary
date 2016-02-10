class AddFieldsToExpeditions < ActiveRecord::Migration
  def change
    add_column :expeditions, :water_temperature, :integer
    add_column :expeditions, :activity_type, :string
    add_column :expeditions, :wind_strength, :integer
    add_column :expeditions, :wind_direction, :string
    add_column :expeditions, :pressure_type, :string
    remove_column :expeditions, :pressure
    add_column :expeditions, :pressure, :integer
  end
end
