class CreateAccessLogs < ActiveRecord::Migration
  def change
    create_table :access_logs do |t|
      t.string :outcome
      t.string :email
      t.string :ip_address
      t.string :http_user_agent

      t.timestamps
    end
  end
end
