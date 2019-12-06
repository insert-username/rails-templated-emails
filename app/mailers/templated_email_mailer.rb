class TemplatedEmailMailer < ApplicationMailer

  def send_templated_email
    @templated_email = params[:templated_email]

    @message_template = @templated_email.message_template

    mail(to: @templated_email.destination_email,
         from: ENV['SENDGRID_USERNAME'],
         subject: "#{@templated_email.sender_name} (#{@message_template.name})",
         body: @message_template.body,
         content_type: 'text/html')
  end

end
