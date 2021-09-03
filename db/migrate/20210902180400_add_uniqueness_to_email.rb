class AddUniquenessToEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true, name: 'uniq_email'
  end
end
