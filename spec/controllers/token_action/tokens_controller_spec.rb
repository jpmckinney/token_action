require 'spec_helper'

describe TokenAction::TokensController do
  before :each do
    @routes = TokenAction::Engine.routes
  end

  describe 'GET redeem' do
    context 'when the token is not found' do
      pending 'redirects to the default failure URL'
      pending 'redirects to the applications root_path if the default failure URL is not routable'
      pending "redirects to the applications root_path if the default failure URL is not set"

      pending 'flashes a path-based failure message'
      pending 'flashes the default failure message if no path-based failure message is set'
    end

    context 'after failing to perform the action' do
      pending "redirects to the token's failure URL"
      pending "redirects to the default failure URL if the token's failure URL is not routable"
      pending "redirects to the default failure URL if the token's failure URL is not set"
      pending 'redirects to the applications root_path if the default failure URL is not routable'
      pending "redirects to the applications root_path if the default failure URL is not set"

      pending 'flashes a path-based, error-based failure message'
      pending 'flashes an error-based failure message'
      pending 'flashes a path-based failure message'
      pending 'flashes the default failure message'
    end

    context 'after performing the action successfully' do
      pending "redirects to the token's success URL"
      pending "redirects to the default success URL if the token's success URL is not routable"
      pending "redirects to the default success URL if the token's success URL is not set"
      pending 'redirects to the applications root_path if the default success URL is not routable'
      pending "redirects to the applications root_path if the default success URL is not set"

      pending 'flashes a path-based success message'
      pending 'flashes the default success message if no path-based success message is set'
    end
  end
end