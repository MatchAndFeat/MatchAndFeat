class LikesController < ApplicationController
  before_action :require_login

  def update
    case params[:likeable]
    when "project" then target = Project.find(params[:id])
    when "feat"    then target = Feat.find(params[:id])
    end
    like = Like.find_by(likeable: target, user: current_user)
    if like == nil
      Like.create(likeable: target, user: current_user)
      @current_user_like_status = "liked"
    else
      like.destroy
      @current_user_like_status = "unliked"
    end
    @likes_count = target.likes.count
    respond_to do |format|
      format.html { redirect_to target }
      format.js { render "shared/like_update" }
    end
  end
end
