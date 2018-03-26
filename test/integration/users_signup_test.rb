require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path,params:{user:{name:"tttt",email:"user@invalid.com",password:"foot",password_confirmation:"footta"}}
    end
    
    assert_template 'users/new'
    assert_select 'div.alert-danger'
    assert_select 'form[action=?]',signup_path
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count',1 do
      post users_path,params:{user:{name:"tttta",email:"user@invalid.com",password:"foothogg",password_confirmation:"foothogg"}}
    end
    follow_redirect! 
    assert_template 'users/show'
    assert_not flash.empty?
  end
end