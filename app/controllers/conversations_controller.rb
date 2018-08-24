class ConversationsController < ApplicationController
   before_action :authenticate_user!

  def index
    skip_policy_scope
   @users = User.all
   @conversations = Conversation.all
    session[:return_to] = request.fullpath
   end

  def create
    skip_authorization

   if Conversation.between(params[:sender_id],params[:recipient_id])
     .present?
      @conversation = Conversation.between(params[:sender_id],
       params[:recipient_id]).first
   else
    @conversation = Conversation.create!(conversation_params)
   end
   redirect_to conversation_messages_path(@conversation)
  end

  private
   def conversation_params
    params.permit(:sender_id, :recipient_id)
   end
end
