require 'rails_helper'

RSpec.feature "user edits an artist" do
  scenario "can follow edit path from show page and edit artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    visit artist_path(artist)
    click_on "Edit"

    fill_in "Name", with: "Jon Liss"
    click_on "Update Artist"

    expect(page).to have_content "Jon Liss"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
