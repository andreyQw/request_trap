class RequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "req_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
