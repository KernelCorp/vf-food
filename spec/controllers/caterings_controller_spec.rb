require 'rails_helper'

describe CateringsController do

  before do
    @catering = create :catering
  end

  it '#index' do
    get :index
    expect(assigns(:caterings)).to eq [@catering]
    puts responce
  end

  it '#show' do
    get :show, id: @catering.id
    expect(assigns(:catering)).to eq @catering
  end

end
