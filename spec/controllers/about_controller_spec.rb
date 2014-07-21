require 'rails_helper'

RSpec.describe AboutController do

  before do
    @about = create :about
  end

  describe 'GET index' do
    it 'find abouts' do
      get :index
      expect(assigns(:about)).to eq [@about]
    end
  end

end
