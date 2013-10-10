class CreatePermissionRoles < ActiveRecord::Migration
  def change
    create_table :permission_roles do |t|
      t.integer :Permission_id, :null => false
      t.integer :role_id, :null => false

      t.timestamps
    end
  end
end
