Rails.application.routes.draw do
  mount TokenAction::Engine => '/token_action'

  root :to => 'hello#hello'
end
