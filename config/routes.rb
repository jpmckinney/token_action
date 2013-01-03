TokenAction::Engine.routes.draw do
  match 'tokens/:token/*path' => 'tokens#redeem', :via => :get
end
