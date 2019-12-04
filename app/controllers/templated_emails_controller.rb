class TemplatedEmailsController < ApplicationController

  def index
    #todo: list all sent emails
    # todo: pagination?
  end

  def new
    @templated_email = TemplatedEmail.new
  end

  def create
    @templated_email = TemplatedEmail.new(templated_email_parameters)

    # todo: should validation fail,
    # redirect back to 'new'
    @templated_email.save

    redirect_to '#index'
  end

  private def templated_email_parameters
    params.require(:templated_email)
        .permit(:sender_name, :destination_email)
  end
end
