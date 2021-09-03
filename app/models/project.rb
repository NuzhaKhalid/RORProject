class Project < ApplicationRecord
  has_many :bugs
  has_and_belongs_to_many :users
  @email
end
