class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate  :end_date_cannot_be_less_than_1_day_after_start_date

  def end_date_cannot_be_less_than_1_day_after_start_date
    if  ends_at < (starts_at + 1.day)
      errors.add(:ends_at, "must be at least 1 day after start date")
    end
  end
end
