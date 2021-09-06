Rails.application.routes.draw do
  resources :projects do
    resources :bugs
  end
  namespace :project do
    resources :bugs
  end
  resources :projects do
    resources :bugs do
      collection do
        get :assign
      end
    end
  end

  devise_for :users
  root to: "projects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
