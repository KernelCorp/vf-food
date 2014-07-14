require 'rails_helper'

describe MasterClassesController do

  before do
    @master_class = create :master_class
  end

  describe 'GET index' do
    it 'find classes' do
      get :index
      expect(assigns(:master_classes)).to eq [@master_class]
    end
  end

  describe 'GET show' do
    it 'find class' do
      get :show, id: @master_class.id
      expect(assigns(:master_class)).to eq @master_class
    end
  end

end
