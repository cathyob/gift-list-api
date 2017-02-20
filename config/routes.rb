# frozen_string_literal: true
Rails.application.routes.draw do
  # resources :notes, except: [:new, :edit]
  # resources :ideas, except: [:new, :edit]
  # # resources :giftees, except: [:new, :edit]
  # resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  post '/giftee' => 'giftees#create'
  get '/giftee/' => 'giftees#index'
  get '/giftee/:id' => 'giftees#show'
  delete '/giftee/:id' => 'giftees#destroy'
  get '/note/:id' => 'notes#show'
  patch '/note/:id' => 'notes#update'
  get '/idea/:id' => 'ideas#show'
  post '/idea' => 'ideas#create'
  patch '/idea/:id' => 'ideas#update'
  # resources :users, only: [:index, :show]
end
