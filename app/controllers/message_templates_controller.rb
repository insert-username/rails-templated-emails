class MessageTemplatesController < ApplicationController

  def show
    @message_template = MessageTemplate.find(params[:id])

    respond_to do |format|
      # display the template to a user.
      format.html

      # may be consumed by ajax
      format.json { render json: @message_template }
    end
  end

end
