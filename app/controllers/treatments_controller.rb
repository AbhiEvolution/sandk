class TreatmentsController < ApplicationController
  def show
    @patient = Patient.find(params[:patient_id])
    @treatment = @patient.treatments.find(params[:id])
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @treatment = Treatment.new
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @treatment = Treatment.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @treatment = Treatment.find(params[:id])
    if @treatment.update(treatment_params)
      flash[:notice] = "Treatment was updated successfully!"
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @treatment = @patient.treatments.create(treatment_params)
    if @treatment.save
      flash[:notice] = "Treatment was created successfully!"
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    patient = Patient.find(params[:patient_id])
    @treatment = Treatment.find(params[:id])
    @treatment.destroy
    flash[:notice] = "Appointment was deleted successfully!"
    redirect_to patient_path(patient)
  end

  private

  def treatment_params
    params.require(:treatment).permit(:typeoftreatement, :quadrant, :teeth, :medicine, :nextappointment, :deposite)
  end
end
