Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'communities/index'
  get 'communities/show'
  get 'communities/new'
  get 'communities/edit'

root to: 'homes#top'

devise_for :admins, controllers: {
sessions:      'admins/sessions',
passwords:     'admins/passwords',
registrations: 'admins/registrations'
}
namespace :admins do
resources :communities do
  resources :posts
end
end

devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
namespace :users do
resources :users ,:only => [:show, :edit,:update]  
resources :communities, :only => [:index,:show] do
 resources :posts, :only => [:index,:show]
end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
