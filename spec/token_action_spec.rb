require 'spec_helper'

describe TokenAction do
  describe '#setup' do
    before :all do
      TokenAction.setup do |config|
        config.success_url = '/hello/success'
        config.failure_url = '/hello/failure'
      end
    end

    it 'should set the default URLs' do
      TokenAction.success_url.should == '/hello/success'
      TokenAction.failure_url.should == '/hello/failure'
    end
  end

  describe '#success_url=' do
    context 'with String argument' do
      before :all do
        TokenAction.success_url = '/hello/success'
      end

      it 'should set the default success URL' do
        TokenAction.success_url.should == '/hello/success'
      end
    end

    context 'with Proc argument' do
      before :all do
        TokenAction.success_url = lambda { '/hello/success' }
      end

      it 'should set the default success URL' do
        TokenAction.success_url.should == '/hello/success'
      end
    end
  end

  describe '#failure_url=' do
    context 'with String argument' do
      before :all do
        TokenAction.failure_url = '/hello/failure'
      end

      it 'should set the default failure URL' do
        TokenAction.failure_url.should == '/hello/failure'
      end
    end

    context 'with Proc argument' do
      before :all do
        TokenAction.failure_url = lambda { '/hello/failure' }
      end

      it 'should set the default failure URL' do
        TokenAction.failure_url.should == '/hello/failure'
      end
    end
  end

  describe '#friendly_token' do
    it 'should return a random alphanumeric string' do
      TokenAction.friendly_token.should match(/\A[A-Za-z0-9]{20}\z/)
    end
  end
end
