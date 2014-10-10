class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.boolean :analytics
      t.boolean :permalinks
      t.boolean :contact_forms
      t.boolean :site_url
      t.boolean :allow_robots
      t.boolean :css_compressed
      t.boolean :javascript_compressed
      t.boolean :redirects
      t.boolean :google_site_map
      t.references :site, index: true

      t.timestamps
    end
  end
end
