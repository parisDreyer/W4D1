class CreateArtwork < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url, unique: true
      t.integer :artist_id
    end
    add_index :artworks, :artist_id, unique: true
  end
end
