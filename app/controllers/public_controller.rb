class PublicController < ApplicationController

  def index
    authorize! :read, :all

    @msg = "Hello Word"
    # Generate uniq key for cache.
    @cache_key = "users/#{User.maximum(:updated_at)}"

    #Cache SQL query
    # @users = Rails.cache.fetch(@cache_key, expires_in: 10.minutes.to_i) do
    #   User.all
    # end
  end

  # only admin can create new stuff
  def create
    authorize! :manage, :all
  end

end