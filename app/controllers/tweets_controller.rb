class TweetsController < ApplicationController
  def index
    if params[:handle]
      @tweets = $client.user_timeline(params[:handle], count: 25)
    end

    render :index
  end
end
