Rails.application.routes.draw do

  # get 'registered_applications/index'
  #
  # get 'registered_applications/show'
  #
  # get 'registered_applications/create'
  #
  # get 'registered_applications/new'
  #
  # get 'registered_applications/destroy'

  devise_for :users

  resources :users, only: [:show] do
    resources :reg_apps
  end

  # namespace :users do
  #   root 'users#edit'# creates user_root_path
  # end

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.

  # You can have the root of your site routed with "root"

end
