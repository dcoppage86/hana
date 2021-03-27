class AddContentToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :content, :text
  end
end
