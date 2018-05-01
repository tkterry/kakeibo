require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  def setup
    @user=User.new(name:"Example User",email:"example@email.com",password:"homedddd",password_confirmation:"homedddd")
    @type=Type.new(title:'生活消耗品',note:'TEST TEXT',budget:'15,000',user:@user)
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

  test "user_id should be present" do
    @type.user=nil
    assert_not @type.valid?
  end

  test "associated types should be destroyed" do
    @type.save
    assert_difference 'Type.count',-@user.type.count do
      @user.destroy
    end
  end


  test "associated receipts should be move" do
    assert_difference 'Receipt.where(type_id:types(:zero).id).count',Receipt.where(type_id:types(:one).id).count do
      types(:one).destroy
    end
  end



end
