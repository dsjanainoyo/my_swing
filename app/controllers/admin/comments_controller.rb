class Admin::CommentsController < ApplicationController
    def destroy
        Comment.find(params[:id]).destroy
        redirect_to admin_event_path(params[:event_id])
    end
end
