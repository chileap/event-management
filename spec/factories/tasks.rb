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
FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyText" }
    all_day { true }
    due_at { "2021-07-10 10:11:51" }
    end_at { "2021-07-10 10:11:51" }
    user
  end
end
