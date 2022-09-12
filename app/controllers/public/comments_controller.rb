class Public::CommentsController < ApplicationController
  def create
    event=Event.find(params[:event_id])
    comment=Comment.new(comment_params)
    comment.event_id = event.id
    comment.user_id=current_user&.id
    comment.musician_id=current_musician&.id

    if comment.user_id
      comment.save
      redirect_to public_event_path(event)
    else
      
      comment.save
      redirect_to musician_event_path(event)
    end 
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment,:user_id,:musician_id)
  end 
end
