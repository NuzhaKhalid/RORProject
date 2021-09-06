class Project < ApplicationRecord
  has_many :bugs, dependent: :delete_all
  has_and_belongs_to_many :users
  @email
end
