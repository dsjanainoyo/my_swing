class Public::RelationshipsController < ApplicationController
  def index
    @musician=current_user.musicians
  end
end
