require 'rails_helper'

RSpec.describe ClientsController do
  before do
    3.times {create :client}
  end

  describe 'GET index' do
    it 'index page show all clients' do
      get :index
      clients = Client.all
      expect(assigns(:clients)).to match(clients)
    end
  end
end
