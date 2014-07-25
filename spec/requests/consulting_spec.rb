require 'rails_helper'

RSpec.describe 'Consulting', type: :request do
  context 'GET /consultings' do
    it 'Consulting empty page' do
      get consulting_index_path
      assert_select '.h3', text: 'Данный раздел еще не заполнен'
    end
  end

  context 'Index page show first consulting' do
    before do
      2.times{ FactoryGirl.create(:consulting) }
      @first = Consulting.first
      get consulting_path(@first)
    end

    it { assert_select '#consulting_description h1', text: @first.name }
    it { assert_select '#consulting_description .description', html: @first.text }
    it { assert_select '#consulting_description .consulting_link_block',
                       href: consulting_path(@first.next_record) }
    it_behaves_like 'Sending_order_form' do
      let(:object_instance_name) { @first.name }
      let(:order_button_name) { 'Заказать ' + @first.name }
      let(:source_page) { consulting_path(@first) }
    end
  end
end
