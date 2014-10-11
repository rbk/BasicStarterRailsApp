class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due
      t.string :assigned_to
      t.references :user, index: true

      t.timestamps
    end
  end
end
