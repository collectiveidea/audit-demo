When 'I create a new page titled "$title"' do |title|
  visit root_path
  click_link "New Page"
  fill_in 'Title', :with => title
  fill_in 'Body', :with => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
  click_button 'Create'
end

Then 'I can see a page title "$title" exists' do |title|
  response.should have_tag('.title', title)
end

Then /^I can see the page titled "(.+)" has (\d+) revisions?$/ do |title, revisions|
  click_link 'Revisions'
  response.should have_tag('.revision', revisions.to_i)
end