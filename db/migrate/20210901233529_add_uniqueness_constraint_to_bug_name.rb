class AddUniquenessConstraintToBugName < ActiveRecord::Migration[6.1]
  def change
    add_index :bugs, [:title, :project_id], unique: true, name: 'uniq_bugs_per_project'
  end
end
