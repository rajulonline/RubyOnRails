class DefectController < ApplicationController
  def defect_analysis
    @defect = Defect.find_all_by_project_id(params[:id])
    # if !Defect.all.nil?
    @total_defects = @defect.count
    @reg_defect_count = Defect.where('project_id in (?) AND category in (?)', params[:id], 'Regression').count
    @unit_test_defect_count = Defect.where('project_id in (?) AND category in (?)', params[:id], 'UnitTest').count
    @def_severity = Defect.where('project_id in (?) AND severity in (?)', params[:id], 'Cosmetic Defect').count

  #@reg_defect_count = Defect.find_all_by_category('Regression').count

  end

  def list_defects
    @defect = Defect.find(:all)
    if @defect.nil?
      flash[:notice]='There are no defects'
    end

    @project = Project.find(:all)
    @defecttype= Defecttype.find(:all)
    @severity = Defectseverity.find(:all)
  end

  def create_defect
    @project = Project.find(:all)
    @requirement = Requirement.find(:all)
    @post = Post.find(:all)
    @login = Login.select('DISTINCT user')
    @status = Status.find(:all)
    @defecttype= Defecttype.find(:all)
    @severity = Defectseverity.find(:all)

    if request.post?
      @defect = Defect.new(params[:defect])

      if params[:defect][:req_name].present?
        defect_new = Defect.new(params[:defect])
        req = Requirement.find_by_req_name([defect_new.req_name])
        req.id
        defect_new.req_id= req.id
        @defect = defect_new
      end
      binding.pry
      # logger.error("----------------------#{@defect.valid?}")
      if @defect.save
        flash[:notice] = "Saved successfully"
        redirect_to :action => "list_defects"
      end
    end
  end

  def get_project_defects
    @project = Project.find_by_name(params[:id])
    if @project.nil?
      @defect=Defect.all
    else
      @defect = Defect.find_all_by_project_id(@project.id)
      if @defect.blank?
        flash.now[:notice]='No defects for this project'
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def destroy
    # @post=Post.find_all_by_parent_tc_id(:id)
    @defect = Defect.find(params[:id])
    @defect.destroy

    respond_to do |format|
      format.html { redirect_to :action=>'list_defects' }
      format.js
    end
  end

  def show
    @defect = Defect.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js
    end
  end

  def update_defect
     defect = Defect.find(params[:defect]['id'])
    defect.update_attributes(params[:defect])
    #get all records
    @defect = Defect.find(:all)
    respond_to do |format|
      format.js
    end
  end

  def edit_defect
   
    if request.post?
      @defect_project=Defect.select('DISTINCT project_id')
      @defect=Defect.find(params[:id])
      @project = Project.find(:all)
      @requirement = Requirement.find(:all)
      @post = Post.find(:all)
      @login = Login.select('DISTINCT user')
      @status = Status.find(:all)
      @defecttype= Defecttype.find(:all)
      @severity = Defectseverity.find(:all)
     
    end
    @defect.save

    respond_to do |format|
      format.html
      format.js
    end
  end

end
