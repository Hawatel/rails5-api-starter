class PublicController < ApplicationController

  def index
    @msg = "Hello Word"

    # Generate uniq key for cache.
    @cache_key = "users/#{User.maximum(:updated_at)}"

    #Cache SQL query
    # @users = Rails.cache.fetch(@cache_key, expires_in: 10.minutes.to_i) do
    #   User.all
    # end

  end

end