class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, uniqueness: true
  
  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User
    
  has_many :shared_art_pieces,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare
    
  has_many :shared_viewers,
    through: :shared_art_pieces,
    source: :viewer
  
end