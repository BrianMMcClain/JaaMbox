require 'rubygems'
require 'sinatra'
require 'discogs'

discogs = Discogs::Wrapper.new("JaaMbox")

get "/" do
  out =  "Welcome to JaaMbox<br /><br />"
  out += "List all releases by an artist:"
  out += "<form method='post' action='/artist'><br />"
  out += "<input type='text' id='artist' name='artist' />"
  out += "<input type='submit' />"
  out += "</form>"
end

get "/artist/:artist" do
  artist_name = params[:artist]
  puts "Looking up #{artist_name}"
  
  begin
    artist = discogs.get_artist(artist_name)
    out = ""
    artist.releases.each do |r|
      out += r.title + "<br />"
    end
  
    return out
  rescue
    return "No releases found"
  end
end

post "/artist" do
  artist_name = params[:artist]
  puts "Looking up #{artist_name}"
  
  begin
    artist = discogs.get_artist(artist_name)
    out = ""
    artist.releases.each do |r|
      out += r.title + "<br />"
    end

    return out
  rescue
    return "No releases found"
  end
end
  
  