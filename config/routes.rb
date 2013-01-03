TokenAction::Engine.routes.draw do
  get 'tokens/:token/*path', :to => 'tokens#redeem'
end
