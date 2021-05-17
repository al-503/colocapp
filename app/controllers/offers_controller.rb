class OffersController < ApplicationController
  def create
    @colocation = Colocation.find(params[:colocation_id])
    @offer = Offer.new
    @offer.colocation = @colocation
    @offer.user = current_user
    @offer.status = "En attente"
    if @offer.save
      redirect_to notification_path
    else
      redirect_to colocation_path(@colocation)
    end
  end
end