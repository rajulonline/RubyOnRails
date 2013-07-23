class RequirementController < ApplicationController
  def list_requirements
    @requirement = Requirement.find(:all)
    if @requirement.nil?
      flash[:notice]='There are no requirements'
    end
    @project = Project.find(:all)
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
       flash.now[:notice]='No requirements for this project'
    end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end


end
