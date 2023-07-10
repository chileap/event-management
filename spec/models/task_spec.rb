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
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }

    describe 'end_at_after_start_at' do
      let(:task) { build(:task) }

      it 'should be valid' do
        expect(task).to be_valid
      end

      it 'should be invalid' do
        task.end_at = task.due_at - 1.day
        expect(task).to be_invalid
      end
    end
  end
end
