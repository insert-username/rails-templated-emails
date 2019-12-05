module TemplatedEmailsHelper

  # adds the bootstrap is-invalid class to the
  # supplied HTML class if the specified field
  # is invalid.
  def append_validity_css_class(existing_html_class, model, field_name)
    model.errors.messages[field_name].empty? ?
      existing_html_class :
      existing_html_class + " is-invalid"
  end

  def enumerate_field_errors(model, field_name)
    model.errors.messages[field_name]
        .map { |m| "<div class=\"invalid-feedback\">#{m}</div>" }
        .join
        .html_safe
  end
end
