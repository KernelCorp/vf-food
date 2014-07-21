require 'rails_helper'

RSpec.describe AboutController do
  before do
    3.times {create :about}
  end

  describe 'GET index' do
    it 'index page show all records' do
      get :index
      about = About.all
      expect(assigns(:about)).to match(about)
    end
  end
end
