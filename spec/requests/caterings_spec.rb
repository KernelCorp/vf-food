require 'rails_helper'

RSpec.describe 'Caterings', :type => :request do
  describe 'GET /caterings' do
    it 'Catering empty page' do
      get caterings_path
      assert_select '.h3', text: 'Данный раздел еще не заполнен'
    end
  end

  describe 'GET some catering' do
    before do
      5.times{ create(:catering) }
    end
    it 'Show first catering' do
      first = Catering.order_by(:name.asc).first
      get catering_path(first)
      # Show page contain header and description
      assert_select '#caterigns .col-sm-7 .h1', text: first.name
      assert_select '#caterigns .col-sm-7 .description', html: first.text
    end

    it 'First catering have other catering links' do
      list = Catering.order_by(:name.asc).all
      first = Catering.order_by(:name.asc).first
      get catering_path(first)
      list.each do |catering|
        assert_select '#caterigns ul.menu li a', text: catering.name
        assert_select '#caterigns ul.menu li a', href: catering_path(catering)
      end
    end

    it 'Catering menu' do
      first = Catering.order_by(:name.asc).first
      get catering_path(first)
      menu = first.menu
      assert_select '#caterigns .menu_block .menu_info .h3', text: menu.name
      assert_select '#caterigns .menu_block .menu_info .description', html: menu.description
      assert_select '#caterigns .menu_block .menu_info .price',
                    text: 'Стоимость: ' + menu.price + ' рублей'
    end

    it 'Catering menu sections' do
      first = Catering.order_by(:name.asc).first
      get catering_path(first)
      first.menu.sections.each do |section|
        assert_select '#caterigns .menu_block .menu_section .title', text: section.name
        assert_select '#caterigns .menu_block .menu_section .text', html: section.text
      end
    end
  end

end
