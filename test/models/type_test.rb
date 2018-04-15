require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  def setup
    @type=Type.new(title:'生活消耗品',note:'TEST TEXT',budget:'15,000')
  end
  test "should be valid" do
    assert @type.valid?
  end
  test "title should be present" do
    @type.title = nil
    assert_not @type.valid?
  end
  test "title should not be too long" do
    @type.title = 'a' * 25
    assert_not @type.valid?
  end
  test "title should be unique" do
    duplicate_type=@type.dup
    @type.save
    assert_not duplicate_type.valid?
  end
end
