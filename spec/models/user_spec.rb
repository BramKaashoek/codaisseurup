require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:events) }
  it { should have_one(:profile) }

  describe "association with booking" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has registrations" do
      expect(guest_user.registered_events).to include(event)
    end
  end
end
