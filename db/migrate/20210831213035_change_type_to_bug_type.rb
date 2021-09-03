class ChangeTypeToBugType < ActiveRecord::Migration[6.1]
  def change
    rename_column :bugs, :type, :bug_type
  end
end
