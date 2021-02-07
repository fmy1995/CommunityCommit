class QuestionaryChoicesController < ApplicationController
  before_action :set_questionary_choice, only: %i[ show edit update destroy ]

  # GET /questionary_choices or /questionary_choices.json
  def index
    @questionary_choices = QuestionaryChoice.all
  end

  # GET /questionary_choices/new
  def new
    @questionary_choice = QuestionaryChoice.new
    @questionary_choice.questionary_item_id = params[:id]
    @questionary_item = QuestionaryItem.find params[:id]
  end

  # POST /questionary_choices or /questionary_choices.json
  def create
    @questionary_choice = QuestionaryChoice.new(questionary_choice_params)

    respond_to do |format|
      if @questionary_choice.save
        format.html { redirect_to '/questionary_choices/new/' + @questionary_choice.questionary_item_id.to_s }
        format.json { render :show, status: :created, location: @questionary_choice }
      else
        format.html { render :new }
        format.json { render json: @questionary_choice.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionary_choice
      @questionary_choice = QuestionaryChoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questionary_choice_params
      params.require(:questionary_choice).permit(:content, :value, :questionary_item_id, :community_id)
    end
end
