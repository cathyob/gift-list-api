# frozen_string_literal: true
class GifteesController < ApplicationController
  before_action :set_giftee, only: [:show, :update, :destroy]

  # GET /giftees
  def index
    @giftees = Giftee.all

    render json: @giftees
  end

  # GET /giftees/1
  def show
    render json: @giftee
  end

  # POST /giftees
  def create
    @giftee = current_user.giftees.new(giftee_params)

    if @giftee.save
      render json: @giftee, status: :created
    else
      render json: @giftee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /giftees/1
  def update
    if @giftee.update(giftee_params)
      render json: @giftee
    else
      render json: @giftee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /giftees/1
  def destroy
    @giftee.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_giftee
    @giftee = Giftee.find(params[:id])
  end
  private :set_giftee

  # Only allow a trusted parameter "white list" through.
  def giftee_params
    params.require(:giftee).permit(:name, :id, :user_id)
  end
  private :giftee_params
end
