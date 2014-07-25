require 'rails_helper'

RSpec.describe 'Contacts', :type => :request do
  describe 'GET /contacts', js: true do
    before do
      visit contacts_path
    end
    it 'Display 2gis map' do
      wait_for_ajax
      expect(page).to have_css('#double-gis-map div.leaflet-container')
    end
    it_behaves_like 'sending_order_form' do
      let(:object_instance_name) { 'contacts' }
      let(:source_page) { contacts_path }
    end
  end
end
