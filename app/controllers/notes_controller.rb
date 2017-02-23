# frozen_string_literal: true
class NotesController < ProtectedController

  # GET /notes/1
  def show
    # get the active user
    giftee = @current_user.giftees.find(params[:id])
    if !giftee.nil?
      render json: giftee.note
    else
      render json: giftee.errors, status: :bad_request
    end
  end

  # PATCH/PUT /notes/1
  def update
    # get the active user
    giftee = @current_user.giftees.find(params[:id])
    if !giftee.nil?
      note = giftee.note
      note.update(note_params)
      if note.valid?
        render json: giftee.note
      else
        render json: note.errors, status: :bad_request
      end
    else
      render status: :bad_request
    end
  end

  # Only allow a trusted parameter "white list" through.
  def note_params
    params.require(:note).permit(:giftee_id, :favorites, :sizes, :general)
  end
  private :note_params
end
