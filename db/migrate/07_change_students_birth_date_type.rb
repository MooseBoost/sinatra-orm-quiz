class ChangeStudentsBirthDateType < ActiveRecord::Migration
  def up
    change_column :students, :birth_date, :datetime
  end

  def down
    change_column :students, :birth_date, :string
  end
end