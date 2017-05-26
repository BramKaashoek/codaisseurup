class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  before_save :set_total_price

  def set_total_price
    price = event.price
    total = price * guests_count
  end

end
