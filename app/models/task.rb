# == Schema Information
#
# Table name: tasks
#
#  id                  :uuid             not null, primary key
#  all_day             :boolean          default(TRUE)
#  description         :text
#  due_at              :datetime
#  end_at              :datetime
#  name                :string           not null
#  recurrence          :text
#  repeat              :string           default("never")
#  repeat_count        :integer
#  repeat_except_dates :jsonb
#  repeat_until_date   :datetime
#  status              :string           default("pending"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :uuid             not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validate :end_at_after_start_at

  private

  def end_at_after_start_at
    return if end_at.blank? || due_at.blank?

    errors.add(:end_at, "must be after start date") if end_at < due_at
  end
end
