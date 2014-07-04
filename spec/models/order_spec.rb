require 'rails_helper'

describe Order do
  describe 'scopes' do
    before do
      FactoryGirl.create :order, name: 'first order'
      FactoryGirl.create :order, name: 'second order'
    end
  end

  describe 'Create order' do

    it 'first order' do
      expect(Order.where(name: 'first order').count).to eq(1)
      expect(Order.where(name: 'second order').count).to eq(1)
    end

    it 'valid order' do
      order = Order.new name: 'order1', email: '123@mail.ru', phone: '456-11-10'
      expect(order.valid?).to eq(true)
    end

    it 'save valid order' do
      order = Order.new name: 'order2', email: '123@mail.ru', phone: '456-11-10'
      expect(order.save).to eq(true)
    end

    it 'invalid order' do
      order = Order.new name: 'order1', email: '123', phone: '456'
      expect(order.valid?).to eq(false)
    end

  end

end
