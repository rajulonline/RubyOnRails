class ProjectController < ApplicationController
  def list_all_projects
    @project = Project.all
    
    if @project.nil?
      flash[:notice]='Currently there are no projects'
    end
     respond_to do |format|
      format.html
      format.js
      format.json
    end

  end
  
  def get_one_project
   # project_name = Project.find_all_by_name(:name)
  # value = Project.find_by_name(project_name).id
  # @project = Project.find_all_by_id(value)

    @project = Project.find_all_by_id(params[:id])
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
    @defect_count = @project.defects.find_all_by_status('Open').count
    @req_count   = @project.requirements.find_all_by_status('In Progress').count
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
end
