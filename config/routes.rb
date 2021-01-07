Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
  resource :relationships, only:[:create, :destroy] 
    get 'follower' => 'relationships#follower', as: 'follower'
    get 'followed' => 'relationships#followed', as: 'followed'
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end 
  
  get 'home/about' => 'homes#about'
  
end


# ...amazonaws.com/users/sign_in

# users/:id
# users/sign_in
