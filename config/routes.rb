Rails.application.routes.draw do

  resources :requests do
    resources :req_info
  end


  get '/req_info/all_req_info', to: 'req_info#index', as: 'req_infos'
  get '/:path_url/requests', to: 'req_info#req_list_by_url', as: 'req_list'
  match '/:path_url/*scheme', to: 'requests#check_req', via: :all, as: 'check_req'

  resources :messages
  resources :articles do
    # match 'test_requests', via: [:get, :post]
    resources :comments
  end

  root 'requests#index'
  # root 'messages#index'

end
