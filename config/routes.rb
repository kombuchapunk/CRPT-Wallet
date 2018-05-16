Rails.application.routes.draw do
  devise_for :users, path: '', skip: [:sessions], path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => { registrations: 'registration' }

  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    get 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: 'home#index'
end
