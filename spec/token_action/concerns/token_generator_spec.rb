require 'spec_helper'

describe TokenAction::TokenGenerator do
  describe '.included' do
    describe '#generate_token' do
      it 'should return a random alphanumeric string' do
        Cat.generate_token(:token).should match(/\A[A-Za-z0-9]{20}\z/)
      end
    end
  end
end
