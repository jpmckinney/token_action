require 'rails_helper'

RSpec.describe TokenAction do
  describe '#setup' do
    before :all do
      TokenAction.setup do |config|
        config.success_url = '/hello/success'
        config.failure_url = '/hello/failure'
      end
    end

    it 'should set the default URLs' do
      expect(TokenAction.success_url).to eq('/hello/success')
      expect(TokenAction.failure_url).to eq('/hello/failure')
    end
  end

  describe '#success_url=' do
    context 'with String argument' do
      before :all do
        TokenAction.success_url = '/hello/success'
      end

      it 'should set the default success URL' do
        expect(TokenAction.success_url).to eq('/hello/success')
      end
    end

    context 'with Proc argument' do
      before :all do
        TokenAction.success_url = lambda { '/hello/success' }
      end

      it 'should set the default success URL' do
        expect(TokenAction.success_url).to eq('/hello/success')
      end
    end
  end

  describe '#failure_url=' do
    context 'with String argument' do
      before :all do
        TokenAction.failure_url = '/hello/failure'
      end

      it 'should set the default failure URL' do
        expect(TokenAction.failure_url).to eq('/hello/failure')
      end
    end

    context 'with Proc argument' do
      before :all do
        TokenAction.failure_url = lambda { '/hello/failure' }
      end

      it 'should set the default failure URL' do
        expect(TokenAction.failure_url).to eq('/hello/failure')
      end
    end
  end

  describe '#friendly_token' do
    it 'should return a random alphanumeric string' do
      expect(TokenAction.friendly_token).to match(/\A[A-Za-z0-9]{20}\z/)
    end
  end
end
