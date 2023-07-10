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
require "rails_helper"

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:end_at) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "enumerize" do
    it { is_expected.to enumerize(:status).in(:confirmed, :cancelled, :tentative) }
    it { is_expected.to enumerize(:repeat).in(:never, :daily, :weekly, :monthly, :yearly) }
  end
end
