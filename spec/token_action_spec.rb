require 'spec_helper'

describe TokenAction do
  describe '#default_redirect_url' do
    it "should respect the application's configuration" do
      TokenAction.default_redirect_url.should == 'http://localhost:3000/'
    end
  end

  describe '#setup' do
    before :all do
      TokenAction.setup do |config|
        config.default_redirect_url = '/foo'
      end
    end

    it 'should set the default redirect URL' do
      TokenAction.default_redirect_url.should == '/foo'
    end
  end

  describe '#default_redirect_url=' do
    context 'with String argument' do
      before :all do
        TokenAction.default_redirect_url = '/foo'
      end

      it 'should set the default redirect URL' do
        TokenAction.default_redirect_url.should == '/foo'
      end
    end

    context 'with Proc argument' do
      before :all do
        TokenAction.default_redirect_url = lambda { '/foo' }
      end

      it 'should set the default redirect URL' do
        TokenAction.default_redirect_url.should == '/foo'
      end
    end
  end

  describe '#friendly_token' do
    it 'should return a random alphanumeric string' do
      TokenAction.friendly_token.should match(/\A[A-Za-z0-9]{20}\z/)
    end
  end
end
