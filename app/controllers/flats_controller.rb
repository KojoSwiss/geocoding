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
end
