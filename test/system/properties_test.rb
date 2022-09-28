require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit properties_url
  
    assert_selector "h1", text: "Properties"
  end
end
