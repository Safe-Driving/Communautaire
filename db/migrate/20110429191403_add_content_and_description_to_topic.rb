class AddContentAndDescriptionToTopic < ActiveRecord::Migration
  def self.up
    add_column :topics, :content, :text
    add_column :topics, :description, :string
  end

  def self.down
    remove_column :topics, :content
    remove_column :topics, :content

  end
end
