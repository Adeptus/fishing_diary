class AddPrivateToExpedition < ActiveRecord::Migration
  def change
    add_column :expeditions, :private, :boolean, default: false
    add_column :expeditions, :hide_place, :boolean, default: false
  end
end
