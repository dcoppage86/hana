class AddProjectCompletedToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :project_completed, :boolean
  end
end
