class RenameCountryColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :destinations, :country, :location
  end
end
