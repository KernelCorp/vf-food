require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        name: 'order 1',
        email: 'e@mail.com',
        phone: '123-44-56',
        from: 'local',
        text: 'some order text'
    }
  }

  let(:invalid_attributes) {
    {
        name: 'order 1',
        email: '@mail.com',
        phone: '1234',
        from: 'local',
        text: 'some order text'
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrdersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, {:order => valid_attributes}, valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, {:order => valid_attributes}, valid_session
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        post :create, {:order => invalid_attributes}, valid_session
        expect(assigns(:order)).to be_a_new(Order)
      end
    end
  end

end
