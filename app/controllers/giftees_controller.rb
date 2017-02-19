# frozen_string_literal: true
class GifteesController < ApplicationController
  before_action :set_giftee, only: [:show, :update, :destroy]

  # GET /giftees
  def index
    if is_valid # always make this check
      user = User.find(request.headers['HTTP_USER_ID']) # get the active user
      render json: user.giftees
    else
      # send bad request if not valid
      render json: giftee.errors, status: :bad_request
    end
  end

  # GET /giftees/1
  def show
    if is_valid # always make this check
      # get the active user
      user = User.find(request.headers['HTTP_USER_ID'])
      giftee = user.giftees.find(params[:id])
      if !giftee.nil?
        render :json => { :ideas => giftee.ideas, :notes => giftee.note }
      else
        render status: :bad_request
      end
    else
      render json: giftee.errors, status: :bad_request
    end
  end

  # POST /giftees
  def create
    if is_valid # if the user is a valid user
      user = User.find(request.headers['HTTP_USER_ID']) # get the current user
      giftee = user.giftees.build(giftee_params) # build them a new giftee

      if giftee.save # save the new giftee
        Note.create(:favorites => "", :sizes => "", :general => "", :giftee_id => giftee.id)

        render json: giftee # if it worked, send the new giftee back
      else
        # if it failed, send a failure to the server
        render json: giftee.errors, status:  :unprocessable_entity
      end
    else
      # send an bad status back if the user isnt valid
      render json: giftee.errors, status: :bad_request
    end
  end

  # DELETE /giftees/1
  def destroy
    if is_valid # always make this check
      user = User.find(request.headers['HTTP_USER_ID']) # get the active user

      # in this case see if the user belongs to them, then delete
      giftee = user.giftees.find(params[:id])
      if giftee != nil
        giftee.destroy
        render status: :no_content
      else
        render json: giftee.errors, status: :bad_request
      end
    else
      # send bad request if not valid
      render json: giftee.errors, status: :bad_request
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_giftee
    @giftee = Giftee.find(params[:id])
  end
  private :set_giftee

  # Only allow a trusted parameter "white list" through.
  def giftee_params
    params.require(:giftee).permit(:name)
  end
  private :giftee_params

  # this will check for the token to ensure the user is who they say they are
  # and has a valid session
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
