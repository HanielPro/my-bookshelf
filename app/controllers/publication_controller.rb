class PublicationController < ApplicationController
  before_action :set_book_author, only: [:destroy]

  def destroy
    @book_author.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Author was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_author
      @book_author = BookAuthor.find(params[:id])
    end
end