class AddIndexToUsersEmployeeNumber < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :employee_number, unique: true
  end
end
