require 'spec_helper'

describe "orgunits/new" do
  before(:each) do
    assign(:orgunit, stub_model(Orgunit).as_new_record)
  end

  it "renders new orgunit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orgunits_path, "post" do
    end
  end
end
