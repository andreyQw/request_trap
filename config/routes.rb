Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :requests do
    resources :req_info
  end

  get '/req_info/all_req_info', to: 'req_info#index', as: 'req_infos'
  get '/:path_url/requests', to: 'req_info#req_list_by_url', as: 'req_list'

  match '/:path_url/*scheme', to: 'requests#check_req', via: :all, as: 'check_req'
  match '/:path_url', to: 'requests#check_req', via: :all, as: 'check_req_without_shem'

  root 'requests#index'

end
