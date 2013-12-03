require 'spec_helper'

describe "studies/new" do
  before(:each) do
    assign(:study, stub_model(Study,
      :title => "MyString",
      :author => "MyString"
    ).as_new_record)
  end

  it "renders new study form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", studies_path, "post" do
      assert_select "input#study_title[name=?]", "study[title]"
      assert_select "input#study_author[name=?]", "study[author]"
    end
  end
end
