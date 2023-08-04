class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(flyer_id: params[:flyer_id])
    bookmark.save
    redirect_to bookmark.flyer, notice: 'Bookmark was successfully created.'
  end

  def destroy
    bookmark = Bookmark.find_by(flyer_id: params[:flyer_id], user_id: current_user.id)
    bookmark.destroy
    redirect_to bookmark.flyer, notice: 'Bookmark was successfully destroyed.'
  end
end
