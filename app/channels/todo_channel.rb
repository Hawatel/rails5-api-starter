class TodoChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'todos'
  end	
end  