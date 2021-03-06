Rails.application.routes.draw do
  root :to => 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stories do
    resources :contributions do
      resources :comments, :only => [:new, :create]
    end
    resources :comments, :only => [:new, :create]
  end
end
