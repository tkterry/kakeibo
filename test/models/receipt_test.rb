require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  def setup
    @user=users(:michael)
    @receipt=@user.receipt.create(payment:500,p_date:'2018-04-14',type_id:types(:one).id,memo:'test')
  end
  test "should be valid" do
    assert @receipt.valid?
  end
  test "memo should not be too long" do
    @receipt.memo = 'a' * 31
    assert_not @receipt.valid?
  end

  test "should not be valid unless type" do
    @receipt.type_id=nil
    assert_not @receipt.valid?
  end

  test "associated receipts should be destroyed" do
    @receipt.save
    assert_difference 'Receipt.count',-@user.receipt.count do
      @user.destroy
    end
  end

end