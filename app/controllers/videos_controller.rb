class VideosController < ApplicationController
  before_action :set_video, only: [:destroy]

  # GET /videos/new
  def new
    @video = Video.new
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(link: video_params[:link], user: current_user)

    if @video.save
      redirect_to athlete_path(current_user)
    else
      render 'new'
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    user_authorised?(@video)
    @video.destroy
    redirect_to athlete_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:link, :user_id)
    end
end
