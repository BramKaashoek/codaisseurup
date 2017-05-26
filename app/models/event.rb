class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate  :end_date_cannot_be_less_than_1_day_after_start_date

 def end_date_cannot_be_less_than_1_day_after_start_date
   return unless ends_at.present? && starts_at.present?
   if  ends_at < (starts_at + 1.day)
     errors.add(:ends_at, "must be at least 1 day after start date")
   end
 end

  def bargain?
    price < 15
  end

  def self.order_by_price
    order(:price)
  end
end
