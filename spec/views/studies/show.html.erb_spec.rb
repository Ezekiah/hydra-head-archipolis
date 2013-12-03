require 'spec_helper'

describe "studies/show" do
  before(:each) do
    @study = assign(:study, stub_model(Study,
      :title => "Title",
      :author => "Author"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Author/)
  end
end
