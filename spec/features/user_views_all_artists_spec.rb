require 'rails_helper'

RSpec.feature "User views all Artists" do
  scenario "they see all the artists names on the page" do
    artist_name1       = "Bob Marley"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist_name2       = "Jack Johnson"
    artist_image_path2 = "http://www.mtv.com/shared/promoimages/bands/j/johnson_jack/a-z/Jack%20Johnson%2003%20CREDIT%20Hillary%20Walsh.jpg"
    artist_name3       = "Hellberg"
    artist_image_path3 = "http://www.thissongslaps.com/wp-content/uploads/2015/03/hellberg19.jpg"

    Artist.create(name: artist_name1, image_path: artist_image_path1)
    Artist.create(name: artist_name2, image_path: artist_image_path2)
    Artist.create(name: artist_name3, image_path: artist_image_path3)

    visit artists_path
    expect(page).to have_content artist_name1
    expect(page).to have_css("img[src=\"#{artist_image_path1}\"]")
    expect(page).to have_content artist_name2
    expect(page).to have_css("img[src=\"#{artist_image_path2}\"]")
    expect(page).to have_content artist_name3
    expect(page).to have_css("img[src=\"#{artist_image_path3}\"]")
  end

  scenario "artist name is a link to artist page" do
    artist = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    visit artists_path
    click_on "Bob Marley"

    expect(page).to have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
