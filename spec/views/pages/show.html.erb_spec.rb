require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/show.html.erb" do
  include PagesHelper
  before(:each) do
    assigns[:page] = @page = stub_model(Page,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "should render attributes in <p>" do
    render "/pages/show.html.erb"
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ body/)
  end
end

