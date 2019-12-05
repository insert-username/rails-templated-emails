require "test_helper"

class TemplatedEmailsHelperTest < ActionView::TestCase

  test 'should append "is-invalid css class"' do
    # todo: this is a little ugly. replace with a mocking framework if I have time.
    model = MockModel.new({ :example_field => [ "error message" ] })

    assert_equal "foo is-invalid",
                 append_validity_css_class("foo", model, :example_field),
                 "Should append the class when the specified field has an error."

    assert_equal "foo",
                 append_validity_css_class("foo", model, :valid_example_field),
                 "Should not append the class for valid fields."

  end

  test "should enumerate field errors" do
    model = MockModel.new({
                              :first_field => %w("first_field_error1", "first_field_error2, first_field_error3"),
                              :second_field => [ ],
                              :third_field => %w(third_field_error1 third_field_error2)
                          })

    first_field_html_errors = enumerate_field_errors(model, :first_field)
    assert first_field_html_errors.include?("first_field_error1")
    assert first_field_html_errors.include?("first_field_error2")
    assert first_field_html_errors.include?("first_field_error3")
    assert_not first_field_html_errors.include?("third")

    second_field_html_errors = enumerate_field_errors(model, :second_field)
    assert_empty second_field_html_errors

    third_field_html_errors = enumerate_field_errors(model, :third_field)
    assert third_field_html_errors.include?("third_field_error1")
    assert third_field_html_errors.include?("third_field_error2")
    assert_not third_field_html_errors.include?("first")
  end

  class MockModel

    attr_reader :errors

    def initialize(fields_to_messages)
      @errors = MockErrors.new(fields_to_messages)
    end

  end

  class MockErrors

    attr_reader :messages

    def initialize(fields_to_messages)
      @messages = MockMessages.new(fields_to_messages)
    end
  end

  class MockMessages

    attr_reader :fields_to_messages

    def initialize(fields_to_messages)
      @fields_to_messages = fields_to_messages
    end

    def [](field_name)
      fields_to_messages.key?(field_name) ?
          fields_to_messages[field_name] :
          []
    end
  end
end