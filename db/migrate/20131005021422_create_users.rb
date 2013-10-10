class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.datetime :last_login_time
      t.string :last_login_ip
      t.integer :login_count

      t.timestamps
    end
  end
end
