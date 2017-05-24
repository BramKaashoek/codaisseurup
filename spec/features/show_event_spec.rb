require "rails_helper"

describe "see a specific event" do

  let(:event) { create :event}

  it "show a event" do
    visit event_url(event)
    expect(page).to have_text(event.name)
  end

  it "have a backbutton" do
    visit event_url(event)
    expect(page).to have_link("Back", events_url)
  end

end
