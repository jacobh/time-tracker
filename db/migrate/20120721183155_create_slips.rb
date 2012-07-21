class CreateSlips < ActiveRecord::Migration
  def change
    create_table :slips do |t|
      t.integer :duration
      t.text :note
      t.integer :project_id
      t.integer :user_id
    end

    add_index :slips, :project_id
    add_index :slips, :user_id
  end
end