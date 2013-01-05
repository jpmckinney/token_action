Rails.application.routes.draw do
  mount TokenAction::Engine => '/token_action'
  get 'hello/token_success', :as => :token_success
  get 'hello/token_failure', :as => :token_failure
  get 'hello/success', :as => :success
  get 'hello/failure', :as => :failure
  get 'hello/not_found', :as => :not_found
  root :to => 'hello#hello'
end
