require 'rails_helper'

RSpec.describe "tasks/index.html.erb", type: :view do
  it "displays all the tasks" do
    render
    expect(rendered).to match /Task/
  end
end
