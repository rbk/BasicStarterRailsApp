class CreateSessionLogs < ActiveRecord::Migration
  def change
    create_table :session_logs do |t|
      t.references :user_id, index: true
      t.string :email
      t.integer :login_count
      t.timestamp :timestamp
      t.date :date
      t.string :ip_address
      t.string :http_referrer
      t.string :http_user_agent

      t.timestamps
    end
  end
end
