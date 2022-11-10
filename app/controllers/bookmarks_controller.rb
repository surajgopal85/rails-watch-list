class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show edit create update destroy]
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    raise

    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
  end

  private

  def set_bookmark
    # @bookmark = Bookmark.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
