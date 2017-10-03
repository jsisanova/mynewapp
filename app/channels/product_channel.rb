class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # If users subscribe to the channel, they start "streaming" all the updates (much like watching a live stream on the internet)
    stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
