class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @patients = pagy_countless(current_user.patients.order(created_at: :desc), items: 10)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def search
    @query = params[:query]
    @patients = Patient.where("patients.name LIKE ?", ["%#{@query}%"])
  end

  def new
    @patient = Patient.new
  end

  def show
    @treatment = @patient.treatments.order("created_at DESC")
  end

  def create
    @patient = current_user.patients.new(patient_params)
    if @patient.save
      flash[:notice] = "patient was created successfully!"
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      flash[:notice] = "patient was updated successfully!"
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    flash[:notice] = "patient was destroyed successfully!"
    redirect_to patients_path
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :address, :phone, :cost, :user_id)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def set_user
    if (current_user.id != @patient.user.id)
      flash[:alert] = "You are not able to perform this action."
      redirect_to patients_path
    end
  end
end
