Rails.application.routes.draw do
  root :to => 'pages#landing'
  post '/details' => 'pages#details'

end
