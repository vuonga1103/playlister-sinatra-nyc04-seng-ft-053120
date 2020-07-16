class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug)
      downcase_artist_name = slug.split("-").join(" ")
      self.all.find { |artist| artist.name.downcase == downcase_artist_name }
  end
end