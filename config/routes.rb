Rails.application.routes.draw do
  resources :projects do
    resources :bugs
  end
  namespace :project do
    resources :bugs
  end

  get "/projects/:project_id/listusers", to: "projects#listusers"
  devise_for :users
  root to: "projects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
