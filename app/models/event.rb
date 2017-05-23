class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
  validates :desription, presence: true, length: {maximum: 500}
end
