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

end
