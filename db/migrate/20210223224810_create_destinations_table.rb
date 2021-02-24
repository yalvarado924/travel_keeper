class CreateDestinationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.text :things_to_do
      t.string :ideal_time_to_visit
      t.string :currency
      t.string :image
      t.integer :user_id
    end
  end
end
