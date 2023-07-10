require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe "enums" do
    it { should enumerize(:status).in(:active, :inactive) }
    it { should enumerize(:role).in(:user, :admin) }
  end
end
