class AddUserIdToExpeditions < ActiveRecord::Migration
  def change
    add_column :expeditions, :user_id, :integer
    add_column :expedition_fishes, :user_id, :integer
  end
end
