class ReqInfoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "req_info_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
