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
FactoryBot.define do
  factory :event do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.full_address }
    start_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    all_day { Faker::Boolean.boolean }
    color { Faker::Color.hex_color }

    user
  end
end
