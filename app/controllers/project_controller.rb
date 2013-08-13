class ProjectController < ApplicationController
  def list_all_projects
    @project = Project.all
    @login = Login.all
    if @project.nil?
      flash[:notice]='Currently there are no projects'
    end
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @project}
    end

  end

  def get_one_project
    # project_name = Project.find_all_by_name(:name)
    # value = Project.find_by_name(project_name).id
    # @project = Project.find_all_by_id(value)

    @project = Project.find_all_by_name(params[:id])
    if @project.nil?
      flash[:notice]='Currently there are no projects'
    end
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def project_dashboard
    if !Post.all.nil?
      @post = Post.find_all_by_project_id(params[:id])

    end
    if !Defect.all.nil?
      @defect = Defect.find_all_by_project_id(params[:id])

    end
    if !Requirement.all.nil?
      @requirement = Requirement.find_all_by_project_id(params[:id])

    end
    @project = Project.find(params[:id])
    @project_id = @project.id
    @defect_count = @project.defects.find_all_by_status('Open').count
    @req_count   = @project.requirements.find_all_by_status('In progress').count
    @post_count = @project.posts.find_all_by_status('Open').count
    @total_in_progress_issues = @post_count+@req_count

    respond_to do |format|
      format.js
      format.html
    end

  end

  def self .all_with_ids
    all.map do |project|
      { :id => project.id }
    end
  end

  def create_new_project
    if request.post?
      @project = Project.new(params[:project])

      if @project.save
        redirect_to :action=>'list_all_projects'
        flash[:notice]= 'Project added successfully'

      end
    end
  end

  def edit_project
    if request.post?
      @project=Project.find(params[:id])
    end
    @project.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update_project
    #write query for update
    proj = Project.find(params[:project]['id'])
    proj.update_attributes(params[:project])
    #get all records
    @project = Project.find(:all)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @requirement=Requirement.find_all_by_project_id(params[:id])
    @post=Post.find_all_by_project_id(params[:id])
    @defect=Defect.find_all_by_project_id(params[:id])
    @project.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to :action=>'list_all_projects'}
    end
  end

  def show
    @project = Project.find(params[:id])
    @requirement = Requirement.find_by_project_id(params[:id])
  end

  def get_detailed_project_info

    if params[:issue_type] == 'OpenTestCases'
      @open_post = Post.where('project_id in (?) AND status  in (?)', params[:proj_id], 'Open')
    end

    if params[:issue_type] == 'Open Defects'
      @open_defect = Defect.where('project_id in (?) AND status  in (?)', params[:proj_id], 'Open')
    end

    if params[:issue_type] == 'In Progress Requirements'
      @in_progress_requirement = Requirement.where('project_id in (?) AND status  in (?)', params[:proj_id], 'In progress')
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def user_management
    @project = Project.all
    @login = Login.all
    if @project.nil?
      flash[:notice]='Currently there are no projects'
    end
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @project}
    end
  end

  def update_project_users
    @project = Project.find_by_id(params[:id])
    binding.pry
  end

end
