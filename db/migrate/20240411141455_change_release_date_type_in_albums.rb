class ChangeReleaseDateTypeInAlbums < ActiveRecord::Migration[7.1]
  def change
    change_column :albums, :release_date, :date
  end
end
