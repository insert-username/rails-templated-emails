require 'test_helper'

class MessageTemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get message template" do
    message_template = MessageTemplate.first

    get message_template_url(message_template)
    assert :success

    # todo: these tests are a little fragile. Consider replacing with
    # more generic selectors.
    assert_select "h5", message_template.name, "Response should contain message template name."
    assert_select "p", message_template.body, "Response should contain message template body."
  end
end
