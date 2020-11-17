class StatisticsController < ApplicationController
  before_action :set_statistic, only: [:show, :edit, :update, :destroy]
  skip_before_action :user_finished?

  # GET /statistics
  # GET /statistics.json
  def index
    @statistics = Statistic.all
  end

  # GET /statistics/1
  # GET /statistics/1.json
  def show
  end

  # GET /statistics/new
  def new
    redirect_to athlete_path(current_user.id) if current_user.statistic
    @statistic = Statistic.new
  end

  # GET /statistics/1/edit
  def edit
  end

  # POST /statistics
  # POST /statistics.json
  def create
    @statistic = current_user.build_statistic(statistic_params)

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to athlete_path(current_user.id), notice: 'Statistic was successfully created.' }
        format.json { render :show, status: :created, location: @statistic }
      else
        format.html { render :new }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statistics/1
  # PATCH/PUT /statistics/1.json
  def update
    respond_to do |format|
      if @statistic.update(statistic_params)
        format.html { redirect_to @statistic, notice: 'Statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @statistic }
      else
        format.html { render :edit }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1
  # DELETE /statistics/1.json
  def destroy
    @statistic.destroy
    respond_to do |format|
      format.html { redirect_to statistics_url, notice: 'Statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statistic
      @statistic = Statistic.find(current_user.statistic.id)
    end

    # Only allow a list of trusted parameters through.
    def statistic_params
      params.require(:statistic).permit(:position, :height, :weight, :points, :rebounds, :assists, :steals, :blocks)
    end
end
