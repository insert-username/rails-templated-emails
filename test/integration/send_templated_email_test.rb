require 'test_helper'

class SendTemplatedEmailTest < ActionDispatch::IntegrationTest
  test "can get send email form" do
    get "/templated_emails/new"
    assert_response :success
    assert_select "form"

    assert_select "#templated_email_sender_name", value: ""
    assert_select "#templated_email_destination_email", value: ""
    assert_select "#templated_email_message_template_id/option", { count: MessageTemplate.count }
  end

  test "can submit send email form" do
    post "/templated_emails",
         params: { templated_email: {
             sender_name: "John Doe",
             destination_email: "test@example.com",
             message_template_id: MessageTemplate.first.id
         } }

    assert_redirected_to controller: "templated_emails", action: "index"
    assert_equal 1, ActionMailer::Base.deliveries.count

    mail_delivery = ActionMailer::Base.deliveries[0]

    assert mail_delivery.subject.include?("John Doe"), "Should have sender name in subject."
    assert mail_delivery.subject.include?(MessageTemplate.first.name),
           "Should have MessageTemplate name in subject."
    assert_equal MessageTemplate.first.body, mail_delivery.body.raw_source
  end

  test "redirected back to send email form if there are errors" do
    post "/templated_emails",
         params: { templated_email: {
             sender_name: "",
             destination_email: "test@example.com",
             message_template_id: MessageTemplate.second.id
         } }
    assert_response :success
    assert_select "#templated_email_destination_email", value: "test@example.com"
    assert_select "#templated_email_message_template_id/option[selected=selected]", { count: 1 } do |element|
      assert_equal "#{MessageTemplate.second.id}",
                   element.attr("value").value,
                   "Selected MessageTemplate should be persisted."
    end
  end
end
