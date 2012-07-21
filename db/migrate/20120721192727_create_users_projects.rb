class CreateUsersProjects < ActiveRecord::Migration
  def change
    create_table :users_projects do |t|
      t.integer :user_id
      t.integer :project_id
    end

    add_index :users_projects, :user_id
    add_index :users_projects, :project_id
  end
end
