Given 'a page titled "$title"' do |title|
  Page.create! :title => title,
    :body => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
end

When 'I create a new page titled "$title"' do |title|
  visit root_path
  click_link "New Page"
  fill_in 'Title', :with => title
  fill_in 'Body', :with => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
  click_button 'Create'
end

When 'I rename the page titled "$old_title" to "$new_title"' do |old_title, new_title|
  visit page_path(Page.find_by_title(old_title))
  click_link 'Edit'
  fill_in 'Title', :with => new_title
  click_button 'Update'
end

When 'I revert the page titled "$title" to revision $rev' do |title, revision|
  page = Page.find_by_title(title)
  visit page_path(page)
  click_link 'Revisions'
  within("form[action='#{page_revision_path(page, revision)}']") do
    click_button 'Revert'
  end
end

Then 'I can see a page title "$title" exists' do |title|
  response.should have_tag('.title', title)
end

Then /^I can see the page titled "(.+)" has (\d+) revisions?$/ do |title, revisions|
  click_link 'Revisions'
  response.should have_tag('.revision', revisions.to_i)
end