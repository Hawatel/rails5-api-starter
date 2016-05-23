if @todos
  json.status "success"
  json.data do
    json.extract! @todos, :id, :title, :completed, :order, :created_at, :updated_at
  end
else
  json.status "fail"
  json.data do
    json.title "Position dosn't exist"
  end
end
