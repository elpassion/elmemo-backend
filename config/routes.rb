Rails.application.routes.draw do
  get '/new' => 'game#create', as: 'game_create'
  get 'game/:id' => 'game#show', as: 'game_show'
end
