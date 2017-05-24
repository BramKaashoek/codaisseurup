require "rails_helper"

describe "About Page" do
  it "the about page can be visited and it will show information about the website" do
    visit root_url
    click_on "About"
    expect(page).to have_content("This page was built in 2017")
  end
end
