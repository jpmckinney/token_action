require 'rails_helper'

module TokenAction
  RSpec.describe TokensController, type: :controller do
    before :each do
      @routes = TokenAction::Engine.routes
    end

    describe 'GET redeem' do
      context 'after failing to perform the action' do
        let :token_with_failure_url do
          FactoryGirl.create(:token, args: ['upgrade'], failure_url: '/hello/token_failure').token
        end
        let :token_with_unroutable_failure_url do
          FactoryGirl.create(:token, args: ['upgrade'], failure_url: '/missing').token
        end
        let :token_without_failure_url do
          FactoryGirl.create(:token, args: ['upgrade']).token
        end
        let :token_with_error do
          FactoryGirl.create(:token, args: ['metamorphose']).token
        end
        let :token_with_namespaced_error do
          FactoryGirl.create(:token, args: ['fly']).token
        end

        it "redirects to the token's failure URL" do
          TokenAction.failure_url = '/hello/failure'
          get :redeem, token: token_with_failure_url, path: 'redeem'
          expect(response).to redirect_to('/hello/token_failure')
        end
        it "redirects to the default failure URL if the token's failure URL is not routable" do
          TokenAction.failure_url = '/hello/failure'
          get :redeem, token: token_with_unroutable_failure_url, path: 'redeem'
          expect(response).to redirect_to('/hello/failure')
        end
        it "redirects to the default failure URL if the token's failure URL is not set" do
          TokenAction.failure_url = '/hello/failure'
          get :redeem, token: token_without_failure_url, path: 'redeem'
          expect(response).to redirect_to('/hello/failure')
        end
        it "redirects to the application's root_path if the default failure URL is not routable" do
          TokenAction.failure_url = '/missing'
          get :redeem, token: token_without_failure_url, path: 'redeem'
          expect(response).to redirect_to(Rails.application.routes.url_for(controller: 'hello', action: 'hello', only_path: true))
        end
        it "redirects to the application's root_path if the default failure URL is not set" do
          TokenAction.failure_url = nil
          get :redeem, token: token_without_failure_url, path: 'redeem'
          expect(response).to redirect_to(Rails.application.routes.url_for(controller: 'hello', action: 'hello', only_path: true))
        end

        it 'flashes a path-based, error-based failure message' do
          get :redeem, token: token_with_error, path: 'confirm'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('This is an path-based, error-based failure message.')
        end
        it 'flashes a error-based failure message' do
          get :redeem, token: token_with_error, path: 'redeem'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('This is an error-based failure message.')
        end
        it 'flashes a long error-based failure message' do
          get :redeem, token: token_with_namespaced_error, path: 'redeem'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('This is another error-based failure message.')
        end
        it 'flashes a path-based failure message' do
          get :redeem, token: token_without_failure_url, path: 'confirm'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('This is a path-based failure message.')
        end
        it 'flashes a long path-based failure message' do
          get :redeem, token: token_without_failure_url, path: 'a/b/c'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('This is another path-based failure message.')
        end
        it 'flashes the default failure message' do
          get :redeem, token: token_without_failure_url, path: 'redeem'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('An error occurred while processing your request.')
        end
      end

      context 'when the token is not found' do
        it 'redirects to the default failure URL' do
          TokenAction.failure_url = '/hello/not_found'
          get :redeem, token: 'missing', path: 'redeem'
          expect(response).to redirect_to('/hello/not_found')
        end
        it "redirects to the application's root_path if the default failure URL is not routable" do
          TokenAction.failure_url = '/missing'
          get :redeem, token: 'missing', path: 'redeem'
          expect(response).to redirect_to(Rails.application.routes.url_for(controller: 'hello', action: 'hello', only_path: true))
        end
        it "redirects to the application's root_path if the default failure URL is not set" do
          TokenAction.failure_url = nil
          get :redeem, token: 'missing', path: 'redeem'
          expect(response).to redirect_to(Rails.application.routes.url_for(controller: 'hello', action: 'hello', only_path: true))
        end

        it 'flashes a path-based failure message' do
          get :redeem, token: 'missing', path: 'confirm'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('This is a path-based not found message.')
        end
        it 'flashes a long path-based failure message' do
          get :redeem, token: 'missing', path: 'a/b/c'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('This is another path-based not found message.')
        end
        it 'flashes the default failure message if no path-based failure message is set' do
          get :redeem, token: 'missing', path: 'redeem'
          expect(flash[:notice]).to eq(nil)
          expect(flash[:alert]).to eq('Sorry, your request could not be processed.')
        end
      end

      context 'after performing the action successfully' do
        let :token_with_success_url do
          FactoryGirl.create(:token, success_url: '/hello/token_success').token
        end
        let :token_with_unroutable_success_url do
          FactoryGirl.create(:token, success_url: '/missing').token
        end
        let :token_without_success_url do
          FactoryGirl.create(:token).token
        end

        it "redirects to the token's success URL" do
          TokenAction.success_url = '/hello/success'
          get :redeem, token: token_with_success_url, path: 'redeem'
          expect(response).to redirect_to('/hello/token_success')
        end
        it "redirects to the default success URL if the token's success URL is not routable" do
          TokenAction.success_url = '/hello/success'
          get :redeem, token: token_with_unroutable_success_url, path: 'redeem'
          expect(response).to redirect_to('/hello/success')
        end
        it "redirects to the default success URL if the token's success URL is not set" do
          TokenAction.success_url = '/hello/success'
          get :redeem, token: token_without_success_url, path: 'redeem'
          expect(response).to redirect_to('/hello/success')
        end
        it "redirects to the application's root_path if the default success URL is not routable" do
          TokenAction.success_url = '/missing'
          get :redeem, token: token_without_success_url, path: 'redeem'
          expect(response).to redirect_to(Rails.application.routes.url_for(controller: 'hello', action: 'hello', only_path: true))
        end
        it "redirects to the application's root_path if the default success URL is not set" do
          TokenAction.success_url = nil
          get :redeem, token: token_without_success_url, path: 'redeem'
          expect(response).to redirect_to(Rails.application.routes.url_for(controller: 'hello', action: 'hello', only_path: true))
        end

        it 'flashes a path-based success message' do
          get :redeem, token: token_without_success_url, path: 'confirm'
          expect(flash[:notice]).to eq('This is a path-based success message.')
          expect(flash[:alert]).to eq(nil)
        end
        it 'flashes a long path-based success message' do
          get :redeem, token: token_without_success_url, path: 'a/b/c'
          expect(flash[:notice]).to eq('This is another path-based success message.')
          expect(flash[:alert]).to eq(nil)
        end
        it 'flashes the default success message if no path-based success message is set' do
          get :redeem, token: token_without_success_url, path: 'redeem'
          expect(flash[:notice]).to eq('Your request was successfully processed.')
          expect(flash[:alert]).to eq(nil)
        end
      end
    end
  end
end
