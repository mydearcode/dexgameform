class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_participant, only: %i[ show edit update destroy ]
  before_action :check_participant, only: [:show, :index]
  before_action :check_owner, only: [:show, :update, :destroy, :edit]

  # GET /participants or /participants.json
  def index
    if current_user.admin?
    @participants = Participant.all    
    else
      redirect_to new_participant_url
    end
    
    
  end

  # GET /participants/1 or /participants/1.json
  def show
    
    
  end

  # GET /participants/new
  def new
    if current_user.participant.nil?
    @participant = Participant.new
    else
      redirect_to @current_user.participant
    end
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants or /participants.json
  def create
    
    @participant = current_user.build_participant(participant_params)
    
    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: "Participant was successfully created." }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: "Participant was successfully updated." }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1 or /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: "Participant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(:firstname, :familyname, :kyc_approved, :agreement, :privacy_agr, :eth_adress, :cont_amount, :eth_tx, :user_id)
    end


    def check_participant
      if current_user.participant.nil?
        redirect_to new_participant_url
      end
    end

    def check_owner
      if @participant.user != current_user && current_user.admin == false
        redirect_to current_user.participant
      end
    end

end
