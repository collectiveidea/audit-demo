require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/index.html.erb" do
  include PagesHelper
  
  before(:each) do
    assigns[:pages] = [
      stub_model(Page,
        :title => "value for title",
        :body => "value for body"
      ),
      stub_model(Page,
        :title => "value for title",
        :body => "value for body"
      )
    ]
  end

  it "should render list of pages" do
    render "/pages/index.html.erb"
    response.should have_tag("a", "value for title".to_s, 2)
  end
end

