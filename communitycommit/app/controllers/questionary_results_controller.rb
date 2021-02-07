class QuestionaryResultsController < ApplicationController
  before_action :set_questionary_result, only: %i[ show edit update destroy ]

  # GET /questionary_results or /questionary_results.json
  def index
    @questionaries = Questionary.all
  end

  # GET /questionary_results/1 or /questionary_results/1.json
  def show
   @questionary = Questionary.find params[:id]
   @questionary_results = QuestionaryResult.where('questionary_id = ?',params[:id])
  end

  def calc
    @questionary = Questionary.find params[:id]
    results = QuestionaryResult.where('questionary_id = ?',params[:id])
    @calc = {}
    results.each do |result|
      data = result.result.split ','
      data.each do |value|
        keyval = value.split ','
        ky = keyval[0].to_s
        vl = keyval[1].to_i
        if ky != 'question_id' then
          if @calc[ky] == nil then
            @calc[ky] =[]
          end
          @calc[ky][vl] == nil ? 1:
             @calc[ky][vl].to_i + 1
        end
      end
    end
  end




  # GET /questionary_results/new
  def new
    @questionary_result = QuestionaryResult.new
  end

  # GET /questionary_results/1/edit
  def edit
  end

  # POST /questionary_results or /questionary_results.json
  def create
    @questionary_result = QuestionaryResult.new(questionary_result_params)

    respond_to do |format|
      if @questionary_result.save
        format.html { redirect_to @questionary_result, notice: "Questionary result was successfully created." }
        format.json { render :show, status: :created, location: @questionary_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @questionary_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionary_results/1 or /questionary_results/1.json
  def update
    respond_to do |format|
      if @questionary_result.update(questionary_result_params)
        format.html { redirect_to @questionary_result, notice: "Questionary result was successfully updated." }
        format.json { render :show, status: :ok, location: @questionary_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questionary_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionary_results/1 or /questionary_results/1.json
  def destroy
    @questionary_result.destroy
    respond_to do |format|
      format.html { redirect_to questionary_results_url, notice: "Questionary result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionary_result
      @questionary_result = QuestionaryResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questionary_result_params
      params.require(:questionary_result).permit(:questionary_id, :result, :community_id)
    end
end
