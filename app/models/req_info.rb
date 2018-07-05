class ReqInfo < ApplicationRecord
  belongs_to :request
  after_create :req_info_send

  def req_info_send
    ActionCable.server.broadcast "req_info_channel",
                                 req_id: self.request.id,
                                 path_url: self.request.path_url,
                                 req_inf_id: self.id,
                                 remote_ip: self.remote_ip,
                                 req_method: self.req_method,
                                 scheme: self.scheme,
                                 query_string: self.query_string,
                                 query_params: self.query_params,
                                 cookies: self.cookies,
                                 headers: self.headers
    # head :ok
  end
end
