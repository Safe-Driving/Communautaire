class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :content
      t.integer :author
      t.integer :topic

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
