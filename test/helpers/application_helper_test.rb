require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "full title helper" do
    assert_equal full_title(),"Kakeibo"
    assert_equal full_title('Sign up'),"Kakeibo_Sign up"
  end
end
