class RenameEmplpyeeNumberColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :emplpyee_number, :employee_number
  end
end
