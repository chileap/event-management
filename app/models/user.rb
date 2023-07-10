class User < ApplicationRecord
  extend Enumerize
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  friendly_id :full_name, use: :slugged

  validates :first_name, presence: true
  validates :last_name, presence: true

  enumerize :role, in: [:user, :admin], default: :user, predicates: true
  enumerize :status, in: [:active, :inactive], default: :active, predicates: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
