require 'test_helper'

class TemplatedEmailTest < ActiveSupport::TestCase

  test "should save if valid" do
    templated_email = create_valid_templated_email

    assert templated_email.save
  end

  test "should have sender_name before save" do
    templated_email = create_valid_templated_email
    templated_email.sender_name = nil

    assert_not templated_email.save
  end

  test "should have destination_email before save" do
    templated_email = create_valid_templated_email
    templated_email.destination_email = nil

    assert_not templated_email.save
  end

  test "should have message_template before save" do
    templated_email = create_valid_templated_email
    templated_email.message_template = nil

    assert_not templated_email.save
  end

  private def create_valid_templated_email
    result = TemplatedEmail.new
    result.sender_name = "Sender Name"
    result.destination_email = "test@example.com"
    result.message_template = MessageTemplate.first

    result
  end
end
