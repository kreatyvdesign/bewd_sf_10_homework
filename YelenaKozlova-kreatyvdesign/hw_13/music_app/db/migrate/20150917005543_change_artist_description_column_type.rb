class ChangeArtistDescriptionColumnType < ActiveRecord::Migration
  def change
    change_column :artists, :description, :text
  end
end
