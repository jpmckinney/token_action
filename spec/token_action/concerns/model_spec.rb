require 'rails_helper'

module TokenAction
  RSpec.describe Token, :type => :model do
    it {should validate_presence_of :kind}
    it {should validate_uniqueness_of :token}

    describe '#create' do
      it 'should set the token' do
        expect(FactoryGirl.create(:token).token).not_to eq(nil)
      end
    end
  end
end
