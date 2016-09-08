class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.column :image_url, :string
      t.column :username, :string
      t.column :content, :string, limit: 255
      t.column :story_id, :integer
      t.timestamps
    end
  end
end
