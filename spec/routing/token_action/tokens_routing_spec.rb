require 'rails_helper'

module TokenAction
  RSpec.describe TokensController, type: :routing do
    describe 'routing' do
      routes { Engine.routes }

      it 'routes to #redeem with default path' do
        expect(get('/tokens/1/redeem')).to route_to('token_action/tokens#redeem', :token =>'1', :path =>'redeem')
      end

      it 'routes to #redeem with custom path' do
        expect(get('/tokens/1/unsubscribe')).to route_to('token_action/tokens#redeem', :token =>'1', :path =>'unsubscribe')
      end

      it 'routes to #redeem with long path' do
        expect(get('/tokens/1/a/b/c')).to route_to('token_action/tokens#redeem', :token =>'1', :path =>'a/b/c')
      end

      it 'routes to #redeem with trailing slash' do
        expect(get('/tokens/1/redeem/')).to route_to('token_action/tokens#redeem', :token =>'1', :path =>'redeem')
      end

      it 'does not route with empty token' do
        expect(get('/tokens//redeem')).not_to be_routable
      end

      it 'does not route with empty path' do
        expect(get('/tokens/1/')).not_to be_routable
      end
    end
  end
end
