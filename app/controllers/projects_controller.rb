class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects or /projects.json
  def index
    @projects = current_user.projects
  end
  # GET /projects/1 or /projects/1.json
  def show
    @bug = @project.bugs.build
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        User.find(current_user.id).projects << Project.find(@project.id)
        @projects_user = ProjectsUser.find_by(user_id: current_user.id, project_id: @project.id)
        format.json { render :show, status: :created, location: @project }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        @projects_user = ProjectsUser.find_by(user_id: current_user.id, project_id: @project.id)
        #employment = Employment.find(:first, :conditions => { :job_id => job.id } )
        #employment.update_attribute(:confirmed, true)
        p = projects_user_params[:user_id]
        p.each do |u|
          if not ProjectsUser.exists?(:user_id => u, :project_id => @project.id)
            User.find(u).projects << Project.find(@project.id)
          end
        end
        puts "THIS IS UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU#{p}"
        for record in ProjectsUser.all
          if record.project_id == @project.id
            found = 0
            p.each do |userr|
              if record.user_id == Integer(userr)
                found = 1
            end
            end
            if found == 0
              ProjectsUser.where(:user_id => record.user_id, :project_id => record.project_id).first.destroy
              #ProjectsUser.find([record.user_id, record.project_id]).destroy
            end
          end
        end
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description)
    end
  def projects_user_params
    params.require(:projects_users).permit(user_id: [])
  end
end
