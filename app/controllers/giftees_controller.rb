# frozen_string_literal: true
class GifteesController < ProtectedController

  # GET /giftees
  def index
    render json: @current_user.giftees
  end

  # GET /giftees/1
  def show
    # get the active user
    giftee = @current_user.giftees.find(params[:id])
    if !giftee.nil?
      render :json => { :ideas => giftee.ideas, :notes => giftee.note }
    else
      render status: :bad_request
    end
  end

  # POST /giftees
  def create
    giftee = @current_user.giftees.build(giftee_params)
    # build them a new giftee

    if giftee.save # save the new giftee
      Note.create(:favorites => "", :sizes => "",
                  :general => "", :giftee_id => giftee.id)
      render json: giftee # if it worked, send the new giftee back
    else
      # if it failed, send a failure to the server
      render json: giftee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /giftees/1
  def destroy
    # in this case see if the user belongs to them, then delete
    giftee = @current_user.giftees.find(params[:id])
    if !giftee.nil?

      if !giftee.note.nil?
        giftee.note.destroy
      end

      # way 2
      giftee.ideas.each do |item|
        item.destroy
      end

      giftee.destroy
      render status: :no_content
    else
      render json: giftee.errors, status: :bad_request
    end
  end

  # Only allow a trusted parameter "white list" through.
  def giftee_params
    params.require(:giftee).permit(:name)
  end
  private :giftee_params
end
