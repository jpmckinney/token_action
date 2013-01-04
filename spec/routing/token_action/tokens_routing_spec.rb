require 'spec_helper'

describe TokenAction::TokensController do
  describe 'routing' do
    before :each do
      @routes = TokenAction::Engine.routes
    end

    it 'routes to #redeem with default path' do
      get('/tokens/1/redeem').should route_to('token_action/tokens#redeem', :token =>'1', :path =>'redeem')
    end

    it 'routes to #redeem with custom path' do
      get('/tokens/1/unsubscribe').should route_to('token_action/tokens#redeem', :token =>'1', :path =>'unsubscribe')
    end

    it 'routes to #redeem with long path' do
      get('/tokens/1/a/b/c').should route_to('token_action/tokens#redeem', :token =>'1', :path =>'a/b/c')
    end

    it 'routes to #redeem with trailing slash' do
      get('/tokens/1/redeem/').should route_to('token_action/tokens#redeem', :token =>'1', :path =>'redeem')
    end

    it 'does not route with empty token' do
      get('/tokens//redeem').should_not be_routable
    end

    it 'does not route with empty path' do
      get('/tokens/1/').should_not be_routable
    end
  end
end
