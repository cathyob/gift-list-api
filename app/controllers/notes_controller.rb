# frozen_string_literal: true
class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes/1
  def show
    if is_valid # always make this check
      # get the active user
      user = User.find(request.headers['HTTP_USER_ID'])
      giftee = user.giftees.find(params[:id])
      if !giftee.nil?
        render json: giftee.note
      else
        render json: giftee.errors, status: :bad_request
      end
    else
      # send bad request if not valid
      render json: giftee.errors, status: :bad_request
    end
  end

  # PATCH/PUT /notes/1
  def update
    if is_valid # always make this check
      # get the active user
      user = User.find(request.headers['HTTP_USER_ID'])
      giftee = user.giftees.find(params[:id])
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
    else
      # send bad request if not valid
      render json: giftee.errors, status: :bad_request
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end
  private :set_note

  # Only allow a trusted parameter "white list" through.
  def note_params
    params.require(:note).permit(:giftee_id, :favorites, :sizes, :general)
  end
  private :note_params

  def is_valid
    return true
    if request.headers.include?('HTTP_TOKEN') && request.headers.include?('HTTP_USER_ID')
      user = User.find(request.headers['HTTP_USER_ID'])
      if !user.nil?
        user.token == request.headers['HTTP_TOKEN']
      else
        false
      end
    else
      puts 'false'
      false
    end
  end
  private :is_valid
end
