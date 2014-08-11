require "rails_helper"

RSpec.describe OrderMailer, :type => :mailer do

  describe 'Send new mail' do

    before do
      OrderMailer.inform_new_order.deliver
    end
    it { expect(ActionMailer::Base.deliveries.empty?).to eq(false) }
  end
end
