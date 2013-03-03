require 'spec_helper'

describe TokenAction::Token do
  it {should validate_presence_of :kind}
  it {should validate_uniqueness_of :token}

  describe '#create' do
    it 'should set the token' do
      FactoryGirl.create(:token).token.should_not be_nil
    end
  end
end
