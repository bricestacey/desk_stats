DeskStats::Application.routes.draw do
  resources :locations

  root :to => 'pages#home'
end
