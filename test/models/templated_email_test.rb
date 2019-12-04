require 'test_helper'

class TemplatedEmailTest < ActiveSupport::TestCase

  test "should save if valid" do
    templated_email = create_valid_templated_email

    assert templated_email.save
  end

  test "should have sender_name before save" do
    assert_does_not_save do |email|
      email.sender_name = nil
    end
  end

  test "sender name should not be blank before save" do
    assert_does_not_save do |email|
      email.sender_name = ""
    end
  end

  test "should have destination_email before save" do
    assert_does_not_save do |email|
      email.destination_email = nil
    end
  end

  test "should have message_template before save" do
    assert_does_not_save do |email|
      email.message_template = nil
    end
  end

  test "should perform basic validation of destination_email field" do
    assert_does_not_save do |email|
      email.destination_email = "invalid email"
    end
  end

  private def create_valid_templated_email
    result = TemplatedEmail.new
    result.sender_name = "Sender Name"
    result.destination_email = "test@example.com"
    result.message_template = MessageTemplate.first

    result
  end

  private def assert_does_not_save
    templated_email = create_valid_templated_email
    yield templated_email

    assert_not templated_email.save
  end
end
