class RemoveCityStateColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :city
    remove_column :destinations, :state
  end
end
