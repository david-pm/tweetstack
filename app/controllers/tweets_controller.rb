class TweetsController < ApplicationController
  def index
    @tweets = $client.user_timeline(sanitize_handle, count: 25) if params[:handle]
  rescue Twitter::Error::NotFound => e
    flash.now[:danger] = "#{params[:handle]} is not a valid Twitter handle"
  rescue Twitter::Error::Unauthorized => e
    flash.now[:danger] = "Sorry, searching for #{params[:handle]} is unauthorized"
  ensure
    render :index
  end

  private def sanitize_handle
    params[:handle].gsub("@", "")
  end
end
