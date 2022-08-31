class Musician::RelationshipsController < ApplicationController
  def index
    @followers=current_musician.relationships

  end
end
