require("spec_helper")

describe("Project") do
  it("returns the projects for an employee") do
    division = Division.create({:name => "sales"})
    employee = Employee.create({:name => "Frank", :division_id => division.id()})
    project1 = Project.create({:name => "Green Bubble", :employee_id => employee.id()})
    project2 = Project.create({:name => "Blue Bubble", :employee_id => employee.id()})
    expect(employee.projects()).to(eq([project1, project2]))
  end
end
