require 'spec_helper'

describe "studies/index" do
  before(:each) do
    assign(:studies, [
      stub_model(Study),
      stub_model(Study)
    ])
  end

  it "renders a list of studies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
