require("spec_helper")

describe("Division") do
  it("returns employees in a division") do
    division = Division.create({:name => "Marketing"})
    employee1 = Employee.create({:name => "Frank", :division_id => division.id()})
    employee2 = Employee.create({:name => "Frank", :division_id => division.id()})
    expect(division.employees()).to(eq([employee1, employee2]))
  end
end
