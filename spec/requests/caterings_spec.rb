require 'rails_helper'

RSpec.describe 'Caterings', type: :request do
  describe 'GET /caterings' do
    it 'Catering empty page' do
      get caterings_path
      assert_select '.h3', text: 'Данный раздел еще не заполнен'
    end
  end

  describe 'GET some catering' do
    before do
      5.times{ create(:catering) }
      @first = Catering.order_by(:name.asc).first
      get catering_path(@first)
    end
    context 'Show first catering' do
      # Show page contain header and description
      it { assert_select '#caterigns .col-sm-7 .h1', text: @first.name }
      it { assert_select '#caterigns .col-sm-7 .description', html: @first.text }
      it_behaves_like 'sending_order_form' do
        let(:object_instance_name) { @first.name }
        let(:order_button_name) { 'Оставить заявку' }
        let(:source_page) { catering_path(@first) }
      end
    end

    context 'First catering have other catering links' do
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

    describe 'Catering menu' do
      before :each do
        @menu = @first.menu
      end
      it { assert_select '#caterigns .menu_block .menu_info .h3', text: @menu.name }
      it { assert_select '#caterigns .menu_block .menu_info .description', html: @menu.description }
      it { assert_select '#caterigns .menu_block .menu_info .price',
                          text: 'Стоимость: ' + @menu.price + ' рублей'}
    end

    describe 'Catering menu sections' do
      it {
        @first.menu.sections.each do |section|
          assert_select '#caterigns .menu_block .menu_section .title', text: section.name
          assert_select '#caterigns .menu_block .menu_section .text', html: section.text
        end
      }
    end
  end

end
