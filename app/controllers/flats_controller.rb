class FlatsController < ApplicationController
  def index
    @flats = Flat.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: helpers.asset_url('location.svg')
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address)
  end
end
