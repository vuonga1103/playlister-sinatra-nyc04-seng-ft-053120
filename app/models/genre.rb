class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
      downcase_genre_name = slug.split("-").join(" ")
      self.all.find { |genre| genre.name.downcase == downcase_genre_name }
  end
end

# "hello"