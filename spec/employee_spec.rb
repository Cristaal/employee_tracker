require("spec_helper")

describe("Employee") do
  it("returns employee's division") do
    division = Division.create({:name => "Marketing"})
    employee = Employee.create({:name => "Frank", :division_id => division.id()})
    expect(employee.division()).to(eq(division))
  end
end
