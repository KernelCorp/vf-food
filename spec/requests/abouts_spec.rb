require 'rails_helper'

RSpec.describe 'Abouts', :type => :request do
  describe 'GET /abouts' do
    it 'Display names of 3 chiefs' do
      list = []
      3.times{ list << create(:about) }
      get about_index_path
      expect(response.status).to be(200)
      3.times do |i|
        # Link to show chief
        assert_select '.col-sm-6 a.chief_link', text: list[i].name
        # Header info chief
        assert_select '.col-sm-6.panel .h3.first_line', text: list[i].name
        assert_select '.col-sm-6.panel .chief_biography', text: list[i].text
      end
    end
  end
end
