require 'spec_helper'

describe "orgunits/index" do
  before(:each) do
    assign(:orgunits, [
      stub_model(Orgunit),
      stub_model(Orgunit)
    ])
  end

  it "renders a list of orgunits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
