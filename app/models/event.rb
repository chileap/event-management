# == Schema Information
#
# Table name: events
#
#  id                  :uuid             not null, primary key
#  all_day             :boolean          default(TRUE)
#  color               :string
#  description         :string
#  end_at              :datetime
#  location            :string
#  name                :string           not null
#  recurrence          :text
#  repeat              :string           default("never")
#  repeat_count        :integer
#  repeat_except_dates :jsonb
#  repeat_until_date   :datetime
#  start_at            :datetime
#  status              :string           default("confirmed")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :uuid             not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Event < ApplicationRecord
  REPEAT_OPTIONS = %w[never daily weekly monthly yearly].freeze

  extend Enumerize

  belongs_to :user

  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :end_at_after_start_at

  enumerize :status, in: [:confirmed, :cancelled, :tentative], default: :confirmed, scope: true, skip_validations: true
  enumerize :repeat, in: REPEAT_OPTIONS, default: :never, scope: true, skip_validations: true

  private

  def end_at_after_start_at
    return if end_at.blank? || start_at.blank?

    errors.add(:end_at, "must be after start date") if end_at < start_at
  end
end
