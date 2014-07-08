require 'rails_helper'

RSpec.describe Project, :type => :model do
  before do
    Project.create name: 'project 1', text: 'some project text'
  end

  describe 'Create project' do
    it 'valid project' do
      order = Project.new name: 'project', text: 'some project text'
      expect(order.valid?).to eq(true)
    end

    it 'save valid project' do
      order = Project.new name: 'project', text: 'some project text'
      expect(order.save).to eq(true)
    end

    it 'invalid project' do
      order = Project.new name: 'project 1', text: 'some project text'
      expect(order.valid?).to eq(false)
    end

  end
end
