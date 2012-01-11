Given /^an instance of an image class that includes `CouchPhoto`:$/ do |string|
  eval string
end

When /^I add an original image to it named 'avatar\.jpg' via the `load_original_from_file` method:$/ do |string|
  eval string
end

When /^I save:$/ do |string|
  eval string
end

Then /^the original image should be added to the database:$/ do |string|
  eval string
end

When /^I call the `load_original` method with filename 'avatar\.jpg' a binary blob:$/ do |string|
  eval string
end

Given /^an image with an original:$/ do |string|
  eval string
end

Then /^I should be able to access metadata about the image via the `original` method:$/ do |string|
  # puts string.encoding.name
  eval string
end

Then /^the original image should be part of the document:$/ do |string|
  eval string
end

Then /^the original image should be a part of the document:$/ do |string|
  eval string
end

When /^I update the original with a new image:$/ do |string|
  eval string
end

Then /^the original image should be the new image:$/ do |string|
  eval string
end

Then /^the auto\-generated variations should be updated:$/ do |string|
  eval string
end
