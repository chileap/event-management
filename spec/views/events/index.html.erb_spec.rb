require "rails_helper"

RSpec.describe "events/index.html.erb", type: :view do
  it "displays all the events" do
    render

    expect(rendered).to match(/Event/)
  end
end
