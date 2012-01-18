@announce
Given /^a full catalog\.xml$/ do
  @aruba_timeout_seconds = 20
  in_current_dir do
    FileUtils.cp '../../assets/catalog.xml', 'catalog.xml'
  end
end

Given /^a sample catalog$/ do
  @aruba_timeout_seconds = 600
  in_current_dir do
    FileUtils.cp '../../assets/catalog.xml', 'catalog.xml'
  end
end

Then /^the file "([^"]*)" should match$/ do |file, expected_string|
  check_file_content(file, /#{expected_string}/, false)
end
