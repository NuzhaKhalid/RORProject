class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :projects
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  USERTYPE_ = [['Developer', 'developer'],
               ['Manager', 'manager'],
               ['QA', 'qa']]
end
