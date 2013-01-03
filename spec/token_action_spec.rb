require 'spec_helper'

describe TokenAction do
  describe '#success_url' do
    it "should respect the application's configuration" do
      TokenAction.success_url.should == 'http://localhost:3000/'
      TokenAction.failure_url.should == '/'
    end
  end

  describe '#setup' do
    before :all do
      TokenAction.setup do |config|
        config.success_url = '/home'
        config.failure_url = '/oops'
      end
    end

    it 'should set the default URLs' do
      TokenAction.success_url.should == '/home'
      TokenAction.failure_url.should == '/oops'
    end
  end

  describe '#success_url=' do
    context 'with String argument' do
      before :all do
        TokenAction.success_url = '/home'
      end

      it 'should set the default success URL' do
        TokenAction.success_url.should == '/home'
      end
    end

    context 'with Proc argument' do
      before :all do
        TokenAction.success_url = lambda { '/home' }
      end

      it 'should set the default success URL' do
        TokenAction.success_url.should == '/home'
      end
    end
  end

  describe '#failure_url=' do
    context 'with String argument' do
      before :all do
        TokenAction.failure_url = '/oops'
      end

      it 'should set the default failure URL' do
        TokenAction.failure_url.should == '/oops'
      end
    end

    context 'with Proc argument' do
      before :all do
        TokenAction.failure_url = lambda { '/oops' }
      end

      it 'should set the default failure URL' do
        TokenAction.failure_url.should == '/oops'
      end
    end
  end

  describe '#friendly_token' do
    it 'should return a random alphanumeric string' do
      TokenAction.friendly_token.should match(/\A[A-Za-z0-9]{20}\z/)
    end
  end
end
