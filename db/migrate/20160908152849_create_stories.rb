class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.column :title, :string
      t.column :genre, :string
      
      t.timestamps
    end
  end
end
