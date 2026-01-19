require "test_helper"

class Fizzy::Saas::SignupTest < ActiveSupport::TestCase
  test "#complete creates account and uses its id as tenant" do
    Account.any_instance.expects(:setup_customer_template).once

    Current.without_account do
      assert_changes -> { Account.count }, +1 do
        signup = Signup.new(
          full_name: "Kevin",
          identity: identities(:kevin)
        )

        assert signup.complete

        assert signup.account
      end
    end
  end

  test "#complete calls cancel on account when account creation fails" do
    Account.any_instance.stubs(:setup_customer_template).raises(StandardError.new("Account setup failed"))

    Current.without_account do
      signup = Signup.new(
        full_name: "Kevin",
        identity: identities(:kevin)
      )

      assert_not signup.complete
      assert_includes signup.errors[:base], "Something went wrong, and we couldn't create your account. Please give it another try."
    end
  end
end
