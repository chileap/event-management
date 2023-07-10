# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  bio                    :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("user"), not null
#  sign_in_count          :integer          default(0), not null
#  slug                   :string           not null
#  status                 :string           default("active"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  extend Enumerize
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  has_many :events, dependent: :destroy
  has_one_attached :avatar

  friendly_id :full_name, use: :slugged

  validates :first_name, presence: true
  validates :last_name, presence: true

  enumerize :role, in: [:user, :admin], default: :user, predicates: true
  enumerize :status, in: [:active, :inactive], default: :active, predicates: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
