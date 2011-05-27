DeskStats::Application.routes.draw do
  resources :locations, :only => [:index] do
    post 'select', :on => :member
  end

  resources :activities, :only => [:create] do
    get 'dashboard', :on => :collection
  end

  namespace "admin" do
    get '/' => 'pages#home'
    resources :locations
    resources :categories
  end

  root :to => 'activities#dashboard'
end
