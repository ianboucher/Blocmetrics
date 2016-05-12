Rails.application.routes.draw do

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.

  # You can have the root of your site routed with "root"

end
