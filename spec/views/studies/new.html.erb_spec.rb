require 'spec_helper'

describe "studies/new" do
  before(:each) do
    assign(:study, stub_model(Study).as_new_record)
  end

  it "renders new study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", studies_path, "post" do
    end
  end
end
