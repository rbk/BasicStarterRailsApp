class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.string :read_time
      t.string :status
      t.references :user, index: true

      t.timestamps
    end
  end
end
