# frozen_string_literal: true
class IdeasController < ProtectedController
  # NOTE - not allowing DESTROY because we do not want the idea to be fully
  # deleted. UPDATE will allow a status change from pending to removed
  # this will later allow sorting and adding another status of purchased
  # to see past gift ideas and purchased gift ideas

  # GET /idea/1
  def show
    giftee = @current_user.giftees.find(params[:id])
    if !giftee.nil?
      render json: giftee.ideas
    else
      render json: giftee.errors, status: :bad_request
    end
  end

  # POST /ideas
  def create
    if idea_params.has_key?(:giftee_id) # if user requests a giftee
      giftee = @current_user.giftees.find(idea_params[:giftee_id])
      # then get that giftee
      if !giftee.nil?
        idea = giftee.ideas.build(idea_params) # and build them an idea
        if idea.save # save the new idea
          render json: idea # if it worked, send the new giftee back
        else # if it failed, send a failure to the server
          render json: idea.errors, status: :unprocessable_entity
        end
      else
        render status: :bad_request
      end
    else # if user didn't specify which giftee
      render status: :bad_request
    end
  end

  # PATCH/PUT /ideas/1
  def update
    giftee = @current_user.giftees.find(params[:id])
    if !giftee.nil?
      idea = giftee.ideas
      if idea.update(idea_params)
        render json: giftee.ideas
      else
        render json: note.errors, status: :bad_request
      end
    else
      render status: :bad_request
    end
  end

  # Only allow a trusted parameter "white list" through.
  def idea_params
    params.require(:idea)
          .permit(:giftee_id, :title, :where, :price, :notes, :status)
  end
  private :idea_params
end
