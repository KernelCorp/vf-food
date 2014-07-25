require 'rails_helper'

RSpec.describe 'MasterClasses', :type => :request do
  describe 'GET /master_classes' do
    it 'Master class empty page' do
      get master_classes_path
      assert_select '.h2', text: 'Данный раздел еще не заполнен'
    end
  end

  describe 'Get some master class' do
    before do
      3.times { create :master_class }
      @first = MasterClass.first
      get master_class_path(@first)
    end
    context 'Show first master class' do
      it { assert_select '#master_classes_show .col-sm-6 .h1', text: @first.name }
      it { assert_select '#master_classes_show .col-sm-6 .elem_to_hide', html: @first.text }
      it_behaves_like 'Sending_order_form' do
        let(:object_instance_name) { @first.name }
        let(:order_button_name) { 'Заказать ' + @first.name }
        let(:source_page) { master_class_path(@first) }
      end
    end

    context 'Other master class links on page' do
      before :each do
        @list = Catering.order_by(:name.asc).all
      end
      it do
        @list.each do |catering|
          assert_select '#caterigns ul.menu li a', text: catering.name
          assert_select '#caterigns ul.menu li a', href: catering_path(catering)
        end
      end
    end

  end
end
