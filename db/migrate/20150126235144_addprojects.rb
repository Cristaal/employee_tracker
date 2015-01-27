class Addprojects < ActiveRecord::Migration
  def change
    create_table(:projects) do |p|
      p.column(:name, :string)
      p.column(:employee_id, :int)

      p.timestamps
    end
  end
end
