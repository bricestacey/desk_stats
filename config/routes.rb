DeskStats::Application.routes.draw do
  resources :locations

  namespace "admin" do
    get '/' => 'pages#home'
    resources :locations
    resources :categories
  end

  root :to => 'pages#home'
end
