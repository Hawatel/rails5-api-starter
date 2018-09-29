module API  
  module V1
    class Todos < Grape::API
      include API::V1::Defaults

      resource :todos do
        desc "Return all Todos"
        get "", root: :todos do
          data = Todo.all
        end

        desc "Return a todo"
        params do
          requires :id, type: String, desc: "ID of the 
            todos"
        end
        get ":id", root: "todo" do
          Todo.where(id: permitted_params[:id]).first!          
        end        


        desc 'Create a todo.'      
          params do  
          requires :title, type: String
          requires :completed, type: Boolean
          requires :order, type: Integer
        end
        post 'createtodo' do       
            res=Todo.create!(declared(params))
            ActionCable.server.broadcast "todos", Todo.all.to_json
            res
        end



        desc "Delete a todo"
        params do
          requires :id, type: Integer, desc: "ID of the todo to Delete"
        end
        delete ":id", root: "todo" do
          Todo.destroy(params[:id])         
        end

        desc "Update a todo"
        params do
          requires :id, type: Integer
          requires :title, type: String
          requires :completed, type: Boolean
          requires :order, type: Integer
        end
        put ":id" do
          Todo.find(params[:id]).update(params)         
        end

      end 
    end
  end
end