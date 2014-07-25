require 'rails_helper'

shared_examples 'sending_order_form' do
  describe 'POST', js: true do
    before do
      visit source_page
    end
    scenario 'invalid data' do
      if defined? order_button_name
        expect(page).to have_css('#order_form', visible: false)
        click_button order_button_name
      end
      expect(page).to have_css('#order_form', visible: true)
      within '#order_form' do
        fill_in :order_name, with: 'User'
        fill_in :order_phone, with: '8-(383)-001--10-10'
        fill_in :order_email, with: '@user@mail.com'
        click_button 'Отправить'
        wait_for_ajax
        expect(page).to have_css('div.error_message', text: /.+/, count: 2)
        expect(page).to have_css('p.bg-success', visible: false)
      end

    end

    scenario 'valid data' do
      if defined? order_button_name
        expect(page).to have_css('#order_form', visible: false)
        click_button order_button_name
      end
      expect(page).to have_css('#order_form', visible: true)
      within '#order_form' do
        fill_in :order_name, with: 'User'
        fill_in :order_phone, with: '8-(383)-001-10-10'
        fill_in :order_email, with: 'user@mail.com'
        click_button 'Отправить'
        wait_for_ajax
        expect(page).to have_css('div.error_message', text: /.+/, count: 0)
        expect(page).to have_css('p.bg-success', visible: true)
      end
    end
  end
end
