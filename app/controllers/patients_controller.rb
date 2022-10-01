class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update,:destroy]
  before_action :set_user, only: [:show, :edit, :update,:destroy]

  def index
    @pagy, @patients = pagy(current_user.patients, items: 10)
  end

  def search
    # Patient.where("patients.name LIKE ?", ["%#{a}%"])
    #  @patients=Patient.where("patients.name LIKE ?", "%"  + params[:q] +  "%")
    @query = params[:query]
    @patients=Patient.where("patients.name LIKE ?",["%#{@query}%"])
    # render "index"
  end

  def new
    @patient = Patient.new
  end

  def show
    @treatment = @patient.treatments.order("created_at ASC")
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

  def destroy
    @patient.destroy
    flash[:notice] = "patient was destroyed successfully!"
    redirect_to patients_path
  end

  def update
    if @patient.update(patient_params)
      flash[:notice] = "patient was updated successfully!"
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :address, :phone, :deposite, :balance, :user_id)
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
