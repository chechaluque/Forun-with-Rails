class CommentsController < ApplicationController
  def create
    @message = Message.find(params[:message])
    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.id

    if comment.save
      redirec_to message_path(@message)
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
