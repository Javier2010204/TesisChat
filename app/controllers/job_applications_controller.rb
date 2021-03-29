class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_application, except:[:index,:new,:create,:new_editor_job]
  before_action :set_students
  before_action :set_professionals
  
  # GET /job_applications
  # GET /job_applications.json
  def index

    if current_user.rol == "student"
      @job_applications_student = JobApplication.where(user_id: current_user.id)
      @job_applications_student.each do |application|
        if application.pending? && DateTime.now > application.expires_date
          application.rejected!
          carrera = application.user.career_id
          random = User.where(rol: "professional").where(career_id: carrera).order(Arel.sql('RANDOM()')).first
          JobApplication.create(user:application.user,professional: random, stage:application.stage, expires_date: DateTime.now + 5.minutes)
        elsif application.pending? && DateTime.now > application.expires_date 
          puts "enviar correo"
        else
          puts "Esperando"  
        end
      end
    else
      @job_applications = JobApplication.all
      @job_applications_professional = JobApplication.where(professional_id: current_user.id)
    end

  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show
  end

  # GET /job_applications/new
  def new
    if params[:rol]
      @professionals = User.where(rol: "editor").order(:name)
      @job_application = JobApplication.new
    else
      @job_application = JobApplication.new
    end
  end
  
  

  # GET /job_applications/1/edit
  def edit
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.expires_date = DateTime.now + 24.hours

    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_application, notice: 'Job application was successfully created.' }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update

    if params[:status] == "1"
      @job_application.accepted!
      Chat.create(user: @job_application.user, professional: @job_application.professional)
      JobApplicationMailer.accepted_client(@job_application).deliver_now
   elsif params[:status] == "0"
       @job_application.rejected!
   end

    respond_to do |format|
        format.html { redirect_to root_path, notice: 'Job application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      params.require(:job_application).permit(:status, :user_id, :professional_id, :stage)
    end

    def set_students
      @students = User.where(rol: "student").order(:name)
    end

    def set_professionals
      @professionals = User.where(rol: "professional").order(:name)
    end

    def set_editors
      @editors = User.where(rol: "editor")
    end
    
    
    
end
