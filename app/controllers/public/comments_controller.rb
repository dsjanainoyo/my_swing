class Public::CommentsController < ApplicationController
  def create
    event=Event.find(params[:event_id])
    comment=Comment.new(comment_params)
    comment.event_id = event.id
    comment.user_id=current_user&.id
    comment.musician_id=current_musician&.id

    if comment.user_id
     
       if comment.save
        redirect_to public_event_path(event)
       else 
         redirect_to public_event_path(event), alert: "コメントを入力してください"
         
        #@error_comment=comment
        #redirect_to public_event_path(event)
       end
    else
      
      if comment.save
        redirect_to musician_event_path(event)
      else 
        @error_comment=comment
        redirect_to public_event_path(event)
      end
    end
    
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_event_path(params[:event_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment,:user_id,:musician_id)
  end 
end
