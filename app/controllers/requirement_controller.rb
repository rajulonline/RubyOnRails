class RequirementController < ApplicationController
  def list_requirements
    @requirement=Requirement.find(:all)
    @requirements_name_autocomplete = Requirement.all.map(&:req_name).join('","').html_safe
    if @requirement.blank?
      flash[:notice]="No requirements"
    end
    @project = Project.find(:all)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_requirement
    @project = Project.find(:all)
    @post = Post.find(:all)
    @login = Login.select('DISTINCT user')
    @status = Status.find(:all)

    if request.post?
      @requirement = Requirement.new(params[:requirement])
      # if @requirement.valid?
      @requirement.save
      flash[:notice] = "Saved successfully"
      redirect_to :action => "list_requirements"
    # end
    end
  end

  def get_project_requirements
    @project = Project.find_by_name(params[:id])
    if @project.nil?
      @requirement=Requirement.all
    else
      @requirement = Requirement.find_all_by_project_id(@project.id)
      if @requirement.blank?
        flash[:notice]='No requirements for this project'
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def edit_requirement
    if request.post?
      #@requirement = Requirement.find(params[:id])
      @project = Project.find(params[:project_id])
      @all_project = Project.all
      @requirement = @project.requirements.find(params[:id])
      @post = Post.find(:all)
      @login = Login.select('DISTINCT user')
      @status = Status.find(:all)
    end
    @requirement.save
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def update_requirement
    #write query for update
    req = Requirement.find(params[:requirement]['id'])
    req.update_attributes(params[:requirement])
    #get all records
    @requirement = Requirement.find(:all)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    # @post=Post.find_all_by_parent_tc_id(:id)
    @requirement = Requirement.find(params[:id])
    requirement = Requirement.find(params[:id])
    @post = Post.find_by_req_id(requirement.id)
    @defect = Defect.find_by_req_id(requirement.id)
    @requirement.destroy
    respond_to do |format|
      format.html {redirect_to :action=>'list_requirements'}
      format.js
    end
  end

  def show
    @requirement = Requirement.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js
    end
  end
  
  def get_search_result
    @requirement = Requirement.find_all_by_req_name(params[:id])
    respond_to do |format|
      format.html { }
      format.js
    end
  end

end

