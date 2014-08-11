require "rails_helper"

RSpec.describe OrderMailer, :type => :mailer do

  describe 'Send new mail' do

    before do
      order = FactoryGirl.create :order
      OrderMailer.inform_new_order(order).deliver
    end
    it { expect(ActionMailer::Base.deliveries.empty?).to eq(false) }
  end
end
