Rails.application.routes.draw do

  namespace :admin do
    resources :abilities
    resources :api_requests
    resources :api_users
    resources :admin_logins
    resources :bribe_drops
    resources :elements
    resources :items
    resources :key_items
    resources :kill_drops
    resources :locations
    resources :mixes
    resources :mix_items
    resources :monsters
    resources :monster_drop_abilities
    resources :steal_drops

    root to: "abilities#index"
  end

  resources :admin_logins, except: :destroy
  get 'admin/logout', to: 'admin_logins#destroy'

  namespace :v1 do
    get '/all(/key/:api_key)', to: 'combinations#index', as: :all_entries

    scope 'abilities' do
      get '/(key/:api_key)', to: 'abilities#index', as: :all_abilities
      get '/:id(/key/:api_key)', to: 'abilities#show', as: :one_ability
    end

    scope 'items' do
      get '/(key/:api_key)', to: 'items#index', as: :all_items
      get '/items_with_monsters(/key/:api_key)', to: "items#items_with_monsters", as: :items_with_monsters
      get '/:id(/key/:api_key)', to: 'items#show', as: :one_item
    end

    scope 'key_items' do
      get '/(key/:api_key)', to: 'key_items#index', as: :all_key_items
      get '/:id(/key/:api_key)', to: 'key_items#show', as: :one_key_item
    end

    scope 'monsters' do
      get '/(key/:api_key)', to: 'monsters#index', as: :all_monsters
      get '/:id(/key/:api_key)', to: 'monsters#show', as: :one_monster
    end

    scope 'locations' do
      get '/(key/:api_key)', to: 'locations#index', as: :all_locations
      get '/:id(/key/:api_key)', to: 'locations#show', as: :one_location
    end

    scope 'mixes' do
      get '/(key/:api_key)', to: 'mixes#index', as: :all_mixes
      get '/:id(/key/:api_key)', to: 'mixes#show', as: :one_mix
    end
  end

  %w( 403 404 422 500 503 ).each do |code|
    get code, to: "errors#show", code: code
  end

  # redirect all non-matched routes to 404
  get('(*all)', to: 'errors#show', code: 404) if Rails.env.production?
end
