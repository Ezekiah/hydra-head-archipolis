require 'spec_helper'

describe "studies/edit" do
  before(:each) do
    @study = assign(:study, stub_model(Study,
      :title => "MyString",
      :author => "MyString"
    ))
  end

  it "renders the edit study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", study_path(@study), "post" do
      assert_select "input#study_title[name=?]", "study[title]"
      assert_select "input#study_author[name=?]", "study[author]"
    end
  end
end
