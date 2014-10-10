class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :server_name
      t.string :server_location
      t.string :ip
      t.string :repository
      t.string :domain
      t.string :dns
      t.string :email
      t.text :notes
      t.boolean :checklist_complete
      t.boolean :deployed

      t.timestamps
    end
  end
end
