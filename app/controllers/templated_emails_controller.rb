class TemplatedEmailsController < ApplicationController

  def index
    @templated_emails = TemplatedEmail.all
  end

  def new
    @templated_email = TemplatedEmail.new
  end

  def create
    @templated_email = TemplatedEmail.new(templated_email_parameters)

    if @templated_email.valid?
      TemplatedEmailMailer.with(templated_email: @templated_email).send_templated_email.deliver_now

      # persist the email now that it has been sent.
      @templated_email.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  private def templated_email_parameters
    params.require(:templated_email)
        .permit(:sender_name, :destination_email, :message_template_id)
  end
end
