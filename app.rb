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
  @employees = Employee.all()
  @divisions = Division.all()
  name = params.fetch("name")
  division_id = params.fetch("division_id").to_i()
  @employee = Employee.new({:name => name, :division_id => division_id})
  @employee.save()
  erb(:index)
end


post("/division") do
  @employees = Employee.all()
  @divisions = Division.all()
  name = params.fetch("name")
  @division = Division.new({:name => name})
  @division.save()
  erb(:index)
end

post("/division_list") do
  @employees = Employee.all()
  division_id = params.fetch("division_id")
  division = Division.find(division_id)
  @divisions = Division.all()
  @division_employees = division.employees()
  erb(:index)
end
