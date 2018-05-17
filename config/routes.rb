Rails.application.routes.draw do
  devise_for :users, path: '', skip: [:sessions], path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => { registrations: 'registration' }

  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  match '/send_btc', to: 'home#send_btc_to_address', via: 'post'

  root to: 'home#index'
end
