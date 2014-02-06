require 'spec_helper'

describe "orgunits/show" do
  before(:each) do
    @orgunit = assign(:orgunit, stub_model(Orgunit))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
