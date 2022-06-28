Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: "posts#index"

  resources :posts, only: :index do
    resources :comments, except: [:show, :destroy, :edit, :update], shallow: true
  end

  namespace :blog_author do
    resources :posts, except: [:show, :update, :edit] do
      resources :comments, except: [:show, :update, :edit], shallow: true
    end
  end
end
