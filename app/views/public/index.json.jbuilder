# get json from cache, if doson't exist execute code from bloc do...end and save in cache
json.cache! ["users/#{@cache_key}"], expired_in: 60.minutes.to_i  do
  json.status "success"
  json.data do
    json.message @msg
    json.array!(User.all) do |user|
      json.extract! user, :id, :email, :current_sign_in_ip
    end
  end
end
