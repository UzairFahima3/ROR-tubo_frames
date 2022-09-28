require "test_helper"

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Address is not given when saving property" do
    property = Property.new
    assert_not property.save, "Saved while address is not given"
  end

  test "Delete the property" do
    property = Property.new
    property.save
    assert property.destroy, "Deleted"
    
    # assert_difference "Property.count", -1 do
    #   delete property_url(property)
    # end
    # assert_redirected_to property_path
    # end
    # assert_not property.delete, "Object is deleted"
  end
end
