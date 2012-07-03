require 'discogs'

discogs = Discogs::Wrapper.new("JaaMbox")
artist = discogs.get_artist("Skrillex")

artist.releases.each do |r|
  puts r.title
end