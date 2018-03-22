class TodoChannel < ApplicationCable::Channel 
# Be Sure to restart your server when you modify this file. # Action Cable runs in a loop that does not support auto loading. 
    def subscribed 
   	 stream_from 'todo' 
    end 
    def unsubscribed 
     # Any cleanup needed when channel is unsubscribed 
    end 

    def broadcast_notification
    	ActionCable.server.broadcast 'todo', 
    	    user: Todo.all
    end