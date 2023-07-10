require "rails_helper"

RSpec.describe "calendars/index.html.erb", type: :view do
  it "displays all the calendars" do
    render

    expect(rendered).to match(/Calendar/)
  end
end
