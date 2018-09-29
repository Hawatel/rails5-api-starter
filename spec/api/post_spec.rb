require 'spec_helper'

#describe Todo::Post do 
 #   it "POST " do
  #    post '/api/v1/todos/createtodo', { 'title' => title, 'order'=>1,'completed'=>"true"}.to_json, 'Content-Type' => 'application/json'
   #   expect(response.status).to eq 201
   #   expect(response.body).to eq({ 'reticulated' => reticulated }.to_json)
   # end
  
#end
describe 'POST /todos' do
    # valid payload
    let(:valid_attributes) { { title: 'demo', order: '1', completed: 'true' } }

    context 'when the request is valid' do
      before { post '/api/v1/todos/createtodo', params: valid_attributes }

      it 'creates a todo' do
        expect(json['title']).to eq('demo')
        expect(json['order']).to eq(1)
        expect(json['completed']).to eq('true')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end