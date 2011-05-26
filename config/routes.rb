DeskStats::Application.routes.draw do
  resources :locations
  resources :categories

  root :to => 'pages#home'
end
