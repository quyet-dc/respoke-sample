class HomeController < ApplicationController

  def index

  end

  def remote_video

  end

  def get_respoke_token
    client = Respoke::Client.new(
        app_secret: "04099d1e-8637-4a70-9ad7-da428bbf5574"
    )

    @respoke_token = client.app_token(
        appId: "7350fe8d-a87c-4899-af2a-7780b2a78b29",
        roleId: "C42A63C1-2EDC-404E-9171-434A0CB457F9",
        endpointId: params[:respoke][:endpointId],
        ttl: 10
    )

    respond_to do |format|
      # format.html
      format.json { render :json => { token: @respoke_token }, :status => :ok }
    end
  end

  private
end