class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_bug, only: [:show, :edit, :update, :destroy, :assign]

  # GET projects/1/bugs
  def index
    @bugs = @project.bugs
  end

  # GET projects/1/bugs/1
  def show
  end

  # GET projects/1/bugs/new
  def new
    @bug = @project.bugs.build
  end

  # GET projects/1/bugs/1/edit
  def edit
  end

  # POST projects/1/bugs
  def create
    @bug = @project.bugs.build(bug_params)

    begin
      @bug.save
      redirect_to(@bug.project)

    rescue Exception
      flash[:notice] = 'Please enter a unique title'
      render action: 'new'

    end

  end

  # PUT projects/1/bugs/1
  def update
    if @bug.update(bug_params)
      redirect_to(@bug.project)
    else
      render action: 'edit'
    end
  end

  def assign
    puts "////////////////////////////////////////////////////////////////////////"
    @bug.update_attribute(:user, current_user)
    puts "////////////////////////////////////////////////////////////////#{current_user}"
    redirect_to(@bug)

  end

  # DELETE projects/1/bugs/1
  def destroy
    @bug.destroy

    redirect_to @project
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def set_bug
      @bug = @project.bugs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bug_params
      params.require(:bug).permit(:title, :status, :bug_type, :deadline, :project_id, :user_id, :screenshot)
    end
end
