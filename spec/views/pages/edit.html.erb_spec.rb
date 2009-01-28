require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/edit.html.erb" do
  include PagesHelper
  
  before(:each) do
    assigns[:page] = @page = stub_model(Page,
      :new_record? => false,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "should render edit form" do
    render "/pages/edit.html.erb"
    
    response.should have_tag("form[action=#{page_path(@page)}][method=post]") do
      with_tag('input#page_title[name=?]', "page[title]")
      with_tag('textarea#page_body[name=?]', "page[body]")
    end
  end
end


