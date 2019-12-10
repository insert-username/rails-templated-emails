require 'test_helper'

class TemplatedEmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new templated email form" do
    get new_templated_email_path
    assert_response :success
  end

  test "should redirect back to new templated email form on error" do
    assert_no_difference(lambda { TemplatedEmail.count }) do
      post(templated_emails_path, params: {templated_email: {
          sender_name: "Sender Name",
          message_template_id: MessageTemplate.first.id
      }})
    end

    assert_response :success
  end

  test "should submit new templated email form" do
    assert_difference(lambda { TemplatedEmail.count }, 1) do
      post(templated_emails_path, params: {templated_email: {
          sender_name: "Sender Name",
          destination_email: "dest.email@example.com",
          message_template_id: MessageTemplate.first.id
      }})
    end

    assert_redirected_to root_path, "After successful send, user should be redirected back to " +
        "summary page."
  end
end
