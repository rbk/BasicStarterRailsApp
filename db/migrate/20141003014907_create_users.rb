class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :age
      t.string :sex
      t.string :first_name
      t.string :last_name
      t.string :group

      t.timestamps
    end
  end
end
