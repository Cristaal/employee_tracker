require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")
require("pry")

get('/') do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post("/employee") do
  name = params.fetch("name")
  division_id = params.fetch("division_id").to_i()
  @employee = Employee.new({:name => name, :division_id => division_id})
  @employee.save()
  redirect back
end


post("/division") do
  name = params.fetch("name")
  @division = Division.new({:name => name})
  @division.save()
  redirect back
end

post("/division_list") do
  @employees = Employee.all() 
  division_id = params.fetch("division_id").to_i()
  @divisions = Division.all()
  @division_employees = Employee.where(division_id: division_id)
  erb(:index)
end
