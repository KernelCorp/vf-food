require 'rails_helper'

RSpec.describe 'Consultings', :type => :request do
  describe 'GET /consultings' do
    it 'Consulting empty page' do
      get consulting_index_path
      assert_select '.h3', text: 'Данный раздел еще не заполнен'
    end

    it 'Index page show first consulting' do
      list = []
      2.times{ list << create(:consulting)}
      get consulting_path(list[0])
      # Show page contain header and description
      assert_select '#consulting_description h1', text: list[0].name
      assert_select '#consulting_description .description', html: list[0].text
      # Show page of first elem contain link on next consulting
      assert_select '#consulting_description .consulting_link_block',
                    href: consulting_path(list[1])
    end
  end
end
