require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user=User.new(name:"Example User",email:"example@email.com",password:"homedddd",password_confirmation:"homedddd")
  end
  
  test "shouraild be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name="  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email="  "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name="aa"*53
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email="a"*258
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses=%w[user@example.com USER@example.com A_US_ER@gooa.saa.sd alice+aa@bac.fd]
    valid_addresses.each do |valid_address|
      @user.email=valid_address
      assert @user.valid?,"#{valid_address.inspect} should be valid"      
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses=%w[user@exampl,com USER@examp@le.com A_US_ERgooa.saa.sd alice+aa@ba+c.fd user@exampl..com]
    invalid_addresses.each do |invalid_address|
      @user.email=invalid_address
      assert_not @user.valid?,"#{invalid_address.inspect} should be invalid"      
    end
  end

  test "email address should be unique" do
    duplicate_user=@user.dup
    duplicate_user.email=@user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email address should be save as lower-case" do
    mixed_case_email="GagaGaSp@eZga.com"
    @user.email=mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase,@user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password=@user.password_confirmation=""*6
    assert_not @user.valid?
  end

  test "password should be too short" do
    @user.password=@user.password_confirmation="a"*5
    assert_not @user.valid?
  end
end
