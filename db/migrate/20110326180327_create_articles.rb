class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :author
      t.integer :category

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
