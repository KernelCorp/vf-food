require 'rails_helper'

RSpec.describe 'Consulting', type: :request do
  describe 'GET /consultings' do
    context 'No consultings' do
      before { get consulting_index_path }
      it { assert_select '.h3', text: 'Данный раздел еще не заполнен' }
    end

    context 'There are some consaltings' do
      before do
        2.times{ FactoryGirl.create(:consulting) }
        @first = Consulting.first
        get consulting_path(@first)
      end

      it { assert_select '#consulting_description h1', text: @first.name }
      it { assert_select '#consulting_description .description', html: @first.text }
      it { assert_select '#consulting_description h1 a', text: @first.next_record.name,
                         href: consulting_path(@first.next_record) }
      it_behaves_like 'sending_order_form' do
        let(:object_instance_name) { @first.name }
        let(:order_button_name) { 'Написать нам' }
        let(:source_page) { consulting_path(@first) }
      end
    end
  end
end
