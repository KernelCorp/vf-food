require 'rails_helper'

describe Catering do
  describe 'create Menu when new instance is created' do
    subject { Catering.create.menu }
    it { should_not be_nil }
    it { should be_a(Menu)}
  end
end