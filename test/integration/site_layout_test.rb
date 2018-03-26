require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home' #テンプレートの描画確認
    assert_select "a[href=?]",root_path,count:3
    assert_select "a[href=?]",new_receipt_path  #receipt_new_path が存在するか否か
    get new_receipt_path
    assert_response :success
    get signup_path
    assert_select 'title',full_title('Sign up')
  end
end
