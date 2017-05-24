require "rails_helper"

describe "Current using looking at list of his personal events" do
  before { login_as user }

  let(:user) { create :user }
  let(:user2) { create :user }
  let!(:event1) { create :event, name: "event1", user: user}
  let!(:event2) { create :event, name: "event2", user: user}
  let!(:event3) { create :event, name: "event3", user: user2}

  it "shows all events" do
    visit events_url
    expect(page).to have_text("event1")
    expect(page).not_to have_text("event3")

  end

end
