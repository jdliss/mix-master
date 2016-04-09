require 'rails_helper'

RSpec.feature "user deletes an artist" do
  scenario "can delete artist from show page" do
    artist_name        = "Bob Marley"
    artist_image_path  = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist_name2       = "The beebz"
    artist_image_path2 = "http://news4share.tk/wp-content/uploads/2015/11/19.jpg?ckattempt=1"

    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    artist2 = Artist.create(name: artist_name2, image_path: artist_image_path2)
    visit artist_path(artist)
    click_on "Delete"

    refute page.has_content?("Jon Liss")
    refute page.has_content?("img[src=\"#{artist_image_path}\"]")
  end
end
