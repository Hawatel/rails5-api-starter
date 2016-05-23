json.status "success"
json.data do
  json.todos do
    json.array!(@todos) do |todo|
      json.extract! todo, :id, :title, :completed, :order
      json.url todo_url(todo, format: :json)
    end
  end
end

# json.employess do
#
#   @users.each do |data|
#     json.data do
#       json.name 'Daniel'
#       json.surname 'Iwaniuk'
#     end
#   end
#
#
#   json.users do
#     json.array! @users.each do |user|
#       json.type 'regular'
#       json.surname user
#       json.role 'admin'
#     end
#   end
#
#   json.users2 do
#     json.array! @users2.each do |user2|
#       json.type 'regular'
#       json.name user2[:name]
#       json.surname user2[:surname]
#       if user2[:name] == 'Daniel'
#         json.role 'admin'
#       else
#         json.role 'read-only'
#       end
#     end
#   end
#
#   # get value from methods
#   json.(@article, :id, :name, :published_at)
#
#   json.attachments @users.each do |user|
#     json.surname user
#     json.role 'admin'
#   end
#
# end

# RESPOND
# {
#     "status":"success",
#     "data": {
#         "users":[
#             {"type":"regular","surname":"Daniel","role":"admin"},
#             {"type":"regular","surname":"Michal","role":"admin"}
#         ]
#     }
# }

# GET /users.
# json.status "success"
# json.data do
#   json.users do
#     json.array! @users.each do |user|
#       json.type 'regular'
#       json.surname user
#       json.role 'admin'
#     end
#   end
# end

# RESPOND
# {
#     "status":"success",
#     "data": {
#         "users":[
#             {"type":"regular","surname":"Daniel","role":"admin"},
#             {"type":"regular","surname":"Michal","role":"admin"}
#         ]
#     }
# }


# # GET /users/1.json
# json.status "success"
# json.data do
#   json.users
#       json.type 'regular'
#       json.surname 'usersname'
#       json.role 'admin'
# end
#
# {
#     "status": "success",
#     "data": {
#         "type": "regular",
#         "surname": "usersname",
#         "role": "admin"
#     }
# }

# DELETE /users/1.json
# json.status "success"
# json.data "null"
#
# {
#     "status": "success",
#     "data": "null"
# }


# == FAIL ===
# json.status "fail"
# json.data do
#   json.title "Position is required"
# end
#
# {
#     "status": "fail",
#     "data": {
#         "title": "Position is required"
#     }
# }
