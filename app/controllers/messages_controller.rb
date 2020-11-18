class MessagesController < ApplicationController

  def create
    @message = Message.new(content: message_params[:content], user: current_user, conversation_id: message_params[:conversation_id] )

    if @message.save
      redirect_to conversation_path(@message.conversation)
    else        
      redirect_to conversation_path(@message.conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id, :conversation_id)
    end
end
