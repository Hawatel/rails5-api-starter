module API  
  module V1
    class Todos < Grape::API
      include API::V1::Defaults
      
      
      resource :todos do
        desc "Return all todos"
        get "", root: :todos do
          Todo.all.to_json
        end
        
        desc "Return all todos _list" 
        get "action_cable_todo_list", root: :todos do 
          ActionCable.server.broadcast 'todo', list: Todo.all 
        end

    
       desc "create a new todo"
       params do
        requires :title, type: String
        requires :completed, type:String
        requires :order, type:Integer
        
       end
       post do
        Todo.create!({
          title:params[:title],
          completed:params[:completed],
          order:params[:order],
         
        })
       end

       desc 'Delete a todo single Record.' 
       params do
         requires :id, type: String, desc: 'Status ID.' 
       end
       delete ':id' do
        if Todo.find(params[:id]).destroy
          return {success: true, message:  "Record deleted succesfully" }
        else 
          return { success: false, message: "some thing went wrong" }
        end
       end
      
      desc "update an todo title"
      params do
        requires :id, type: String
        requires :title, type:String
      end
      put ':id' do
       # put'delte method is calling'
        Todo.find(params[:id]).update({
        title:params[:title]
        })
      end

        desc "Return a todo"
        params do
          requires :id, type: String, desc: "ID of the 
            todo"
        end
        get ":id", root: "todos" do
          Todo.where(id: permitted_params[:id]).first
        end
      end
    end
  end
end  