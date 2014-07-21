class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  private

  def client_params
    params.require(:client).permit :name, :link, :attachment
  end

end
