Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: :show
  scope '/admin' do
    resources :users, except: :show
    resources :comments, only: :index
  end
  
  get 'categories/add', to: 'categories#add'
  post 'categories/:id/create', to: 'categories#create'

  resources :categories
  resources :comments, except: [:new, :index]

  delete 'comment/:id/delete' => 'comments#destroy', as: 'delete_comment'

  post "vote/vote" => "votes#vote", as: "vote_opinion"
  patch 'debates/comment/:id/disable' => 'comments#disable', as: 'disable_comment'
  patch 'opinions/:id/disable' => 'opinions#disable', as: 'disable_opinion'

    # resources :debates do
    #   resources :opinions do
    #   	resources :comments
    #   end
    # end
  get 'search', to: 'search#search'
  
  resources :opinions do
    
    post 'create'
    collection do
      get 'search_image'
      post 'query_image'
    end

    resources :debates

  end
  
  # get 'opinions/:opinion_id/debates' => 'debates#new', as: 'new_opinion_debate'  
  # post 'opinions/:opinion_id/debates' => 'debates#create'
  # get 'opinions/:opinion_id/debates/:id' => 'debates#edit', as: 'edit_opinion_debate'

  
  root 'opinions#index'
end