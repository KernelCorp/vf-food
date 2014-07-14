require 'rails_helper'

describe CateringsController do

  before do
    @catering = create :catering
  end

  describe 'GET index' do
    it 'find caterings' do
      get :index
      expect(assigns(:caterings)).to eq [@catering]
    end
  end

  describe 'GET show' do
    it 'find catering' do
      get :show, id: @catering.id
      expect(assigns(:catering)).to eq @catering
    end
  end

end
