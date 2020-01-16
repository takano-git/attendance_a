class AddEmplpyeeNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :emplpyee_number, :integer
  end
end
