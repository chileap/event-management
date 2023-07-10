require "rails_helper"

RSpec.describe "dashboard/index.html.erb", type: :view do
  it "displays the dashboard" do
    render
    expect(rendered).to match(/Dashboard/)
  end
end
