
class CreateUserDepts < ActiveRecord::Migration
  def change
    create_table :user_depts do |t|
      t.integer :user_id, :null => false
      t.integer :dept_id, :null => false

      t.timestamps
    end
  end
end
