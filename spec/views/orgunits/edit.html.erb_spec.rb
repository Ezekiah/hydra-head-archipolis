require 'spec_helper'

describe "orgunits/edit" do
  before(:each) do
    @orgunit = assign(:orgunit, stub_model(Orgunit))
  end

  it "renders the edit orgunit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orgunit_path(@orgunit), "post" do
    end
  end
end
