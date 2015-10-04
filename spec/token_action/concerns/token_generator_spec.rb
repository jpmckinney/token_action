require 'rails_helper'

module TokenAction
  RSpec.describe TokenGenerator do
    describe '.included' do
      describe '#generate_token' do
        it 'should return a random alphanumeric string' do
          expect(Cat.generate_token(:token)).to match(/\A[A-Za-z0-9]{20}\z/)
        end
      end
    end
  end
end
