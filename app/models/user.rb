class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :contacts, :through => :groups, :source => :user

  enum role: [:user, :customer, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
