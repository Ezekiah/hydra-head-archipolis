require 'spec_helper'

describe "studies/edit" do
  before(:each) do
    @study = assign(:study, stub_model(Study))
  end

  it "renders the edit study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", study_path(@study), "post" do
    end
  end
end
