Rails.application.routes.draw do

  get 'events/show'

  get 'events/edit'

  get 'events/update'

  get 'events/destroy'

# The controller must be specified here otherwise Devise uses the default controllers
# and changes to the custom parameters in the registrations controller get filtered
# out.
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:show] do
    resources :reg_apps do
      resources :events
    end
  end

  authenticated :user do
    root 'reg_apps#index', as: :authenticated_root
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  # The priority is based upon order of creation: first created -> highest priority.

end
