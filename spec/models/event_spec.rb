require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "check associations" do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:categories)}
  end

  describe "check validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500)}
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }
    it "is event invalid if start date is less than 1 day before end date?" do
      event = build :event, starts_at: DateTime.new(2001,1,2,1,1) , ends_at:DateTime.new(2001,1,2,1,1)
      event.valid?
      expect(event.errors).to have_key(:ends_at)
    end
    it "is event valid if start date is more than 1 day before end date" do
      event = build :event, starts_at: DateTime.new(2001,1,2,1,1) , ends_at:DateTime.new(2001,1,4,1,1)
      event.valid?
      expect(event.errors).not_to have_key(:ends_at)
    end
  end

  describe "#bargain?" do
    let(:event1) { create :event, price: 30 }
    let(:event2) { create :event, price: 10 }

    it "events with a price below 15 should be a bargain, others shouldnt" do
      expect(event1.bargain?).not_to eq(true)
      expect(event2.bargain?).to eq(true)
    end
  end

  describe ".order_by_price" do
    let(:event300) { create :event, price: 300 }
    let(:event100) { create :event, price: 100 }
    let(:event20) { create :event, price: 20 }
    let(:event10) { create :event, price: 10 }

    it "orders events by price" do
      expect(Event.order_by_price).to match_array [event300, event100, event20, event10]
    end
  end

  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has event guests" do
      expect(event.guests).to include(guest.user)
    end
  end

end
