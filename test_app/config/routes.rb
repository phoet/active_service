TestApp::Application.routes.draw do
  resources :payments
  
  root :to => "payments#index"
end
