require 'rails_helper'
#require 'spec_helper'


RSpec.describe API::V1 do
	let!(:present_todo) { create(:todo) }
	let(:create_todo_params) {{ title: 'title', completed:'completed', order: '1' }}
    
    describe 'get a one single record' do
    	it 'returns a single todo record' do 
    		get "/api/v1/todos/#{present_todo.id}"
            json = JSON.parse(response.body)
            expect(json["id"]).to eq present_todo.id
        end 
    end
    describe 'update record' do
    	it 'update a record' do
    		put "/api/v1/todos/#{present_todo.id}", {id: present_todo.id, title: 'title'}
            present_todo.reload
            expect(present_todo.title).to eq 'title'
        end
    end
  
    describe 'it create a todo record' do
    	it 'creates many todos' do
    		expect{ post "/api/v1/todos", create_todo_params}.to change(Todo, :count).by(+1)
            record = JSON.parse(response.body)
            expect(record['title']).to eq create_todo_params[:title]
            expect(record['completed']).to eq create_todo_params[:completed]
            expect(record['order']).to eq create_todo_params[:order]
        end
    end
    describe 'delete a todo record' do
    	it 'Delete  a record' do
    		expect{ delete "/api/v1/todos/#{present_todo.id}"}.to change(Todo, :count).by(-1)
            expect(response.status).to eq 200
        end
    end
    describe 'list of all todos' do
    	it 'show all todos record' do
    		delete "/api/v1/todos/"
    		expect(response.body).to eq present_todo
        end
    end
end