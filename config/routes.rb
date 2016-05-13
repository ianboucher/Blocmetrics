Rails.application.routes.draw do

# permitting custom user in the Devise registrations controller didn't work until
# I added the custom routes to the Devise defaults - I don't understand why...
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:show] do
    resources :reg_apps
  end

  authenticated :user do
    root 'reg_apps#index', as: :authenticated_root
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.

end
