Rails.application.routes.draw do
  root 'currencies#index'

  get 'currencies/index'
end
