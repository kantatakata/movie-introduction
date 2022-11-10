class AddGenreIdToTheaters < ActiveRecord::Migration[6.1]
  def change
    add_column :theaters, :genre_id, :integer
  end
end
