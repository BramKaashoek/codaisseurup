require "rails_helper"

describe "Terms and Conditions page" do
  it "There is a link to the terms and conditions page where you can read the terms and conditions" do
    visit root_url
    click_on "Terms and Conditions"
    expect(page).to have_content("These are the terms and conditions")
  end
end
