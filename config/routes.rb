Rails.application.routes.draw do
  root 'game#create', as: 'game_create'
  get 'game/:id' => 'game#show', as: 'game_show'
end
