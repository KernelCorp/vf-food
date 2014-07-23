require 'rails_helper'

RSpec.describe 'Clients', :type => :request do
  describe 'GET /clients' do
    before do
      5.times { create :client }
    end
    it 'works! (now write some real specs)' do
      get clients_path
      list = Client.all
      list.each do |client|
        assert_select '#clients-container #client-block a', href: client_path(client)
      end
    end
  end
end
