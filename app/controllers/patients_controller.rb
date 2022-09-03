class PatientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @patients = pagy(Patient.all, items: 1)
  end

  def new
    @patient = Patient.new
  end

  def show
    @patient = Patient.find(params[:id])
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
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:notice] = "patient was updated successfully!"
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :address, :phone,:deposite,:balance, :user_id)
  end
end
