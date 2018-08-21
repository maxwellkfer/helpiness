class MessagesController < ApplicationController
    before_action do
     @conversation = Conversation.find(params[:conversation_id])
    end

  def index

    skip_policy_scope
    @messages = @conversation.messages
    if @messages.length > 10
     @over_ten = true
     @messages = @messages[-10..-1]
    end
    if params[:m]
     @over_ten = false
     @messages = @conversation.messages
    end
   if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    @message = @conversation.messages.new
  end
   end

  def new
    skip_authorization
    @message = @conversation.messages.new
  end

  def create
    skip_authorization
     @message = @conversation.messages.new(message_params)
     skip_policy_scope
     if @message.save
      redirect_to conversation_messages_path(@conversation)
   end
  end

  private
   def message_params
    params.require(:message).permit(:body, :user_id)
   end
end
