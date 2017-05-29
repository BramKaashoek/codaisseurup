class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @registration = current_user.registrations.new(registration_params.merge(event_id: params[:event_id]))
    @registration.set_total_price
    @registration.save
    redirect_to root_path, notice: "Thank you for registering!"
  end

  private

  def registration_params
    params.require(:registration).permit(:event_id, :status, :price, :guests_count)
  end
end
