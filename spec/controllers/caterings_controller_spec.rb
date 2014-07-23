require 'rails_helper'

describe CateringsController do

  let(:valid_attributes){
    {
        name: 'Catering ones',
        text: 'Some long text for this project',
        seo: ActsAsPage::Seo.new(title: 'Some catering title',
                                 description: 'some desc', keywords: 'keys')
    }
  }

  before do
    @catering = create :catering
  end



  describe 'GET index' do
    it 'redirect to first elem' do
      get :index
      expect(response).to redirect_to(catering_path(@catering))
    end
  end

  describe 'GET show' do
    it 'show catering' do
      get :show, id: @catering.id
      expect(assigns(:catering)).to eq @catering
    end

    it 'show page contain all caterings' do
      get :show, id: @catering.id
      3.times{ create :catering }
      all = Catering.order_by(:name.asc).all
      expect(assigns(:caterings)).to eq all
    end
  end

end
