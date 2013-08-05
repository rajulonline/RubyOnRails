class DefectController < ApplicationController
  def defect_analysis
    @defect = Defect.find_all_by_project_id(params[:id])
    @project_id = params[:id]
    @defect_types = Defecttype.select('DISTINCT category')
    @defect_severity = Defectseverity.select('DISTINCT severity')
    # if !Defect.all.nil?
    @total_defects = @defect.count

    @reg_defect_count = Defect.where('project_id in (?) AND category in (?)', params[:id], @defect_types[0].category).count
    @unit_test_defect_count = Defect.where('project_id in (?) AND category in (?)', params[:id], @defect_types[1].category).count
    @missed_during_regression_defect_count = Defect.where('project_id in (?) AND category in (?)', params[:id], @defect_types[2].category).count
    @adhoc_defect_count = Defect.where('project_id in (?) AND category in (?)', params[:id], @defect_types[3].category).count
    @automation_defect_count = Defect.where('project_id in (?) AND category in (?)', params[:id], @defect_types[4].category).count
    @production_defect_count = Defect.where('project_id in (?) AND category in (?)', params[:id], @defect_types[5].category).count

    @cosmetic_def_severity = Defect.where('project_id in (?) AND severity in (?)', params[:id], @defect_severity[0].severity).count
    @show_stopper_def_severity = Defect.where('project_id in (?) AND severity in (?)', params[:id], @defect_severity[1].severity).count
    @minor_def_severity = Defect.where('project_id in (?) AND severity in (?)', params[:id], @defect_severity[2].severity).count
    @work_around_possible_def_severity = Defect.where('project_id in (?) AND severity in (?)', params[:id], @defect_severity[3].severity).count
    @major_but_not_show_stopper_def_severity = Defect.where('project_id in (?) AND severity in (?)', params[:id], @defect_severity[4].severity).count

  end

  def get_detailed_defect_info
    if params[:analysis_by] == 'defect_type'
      @defect_analysis_type = Defect.where('project_id in (?) AND category in (?)', params[:proj_id], params[:issue_type])
    end

    if params[:analysis_by] == 'defect_severity'
      @defect_analysis_severity = Defect.where('project_id in (?) AND severity in (?)', params[:proj_id], params[:issue_type])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def list_defects
    @defect = Defect.find(:all)
    @defect_description_autocomplete = Defect.all.map(&:def_description).join('","').html_safe
    

    if @defect.nil?
      flash[:notice]='There are no defects'
    end

    @project = Project.find(:all)
    @defecttype= Defecttype.find(:all)
    @severity = Defectseverity.find(:all)
  end

  def get_requirement_name

    if params[:id]
      @requirement = Requirement.find_all_by_project_id(params[:id])
      if @requirement.nil?
        @requirement=[]
      end
      @post = Post.find_all_by_req_name(params[:id])
      if @post.blank?
        @post=[]
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
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
      # logger.error("----------------------#{@defect.valid?}")
      if @defect.save
        flash[:notice] = "Saved successfully"
        respond_to do |format|
          format.html { redirect_to :action => "list_defects"}
          format.js
        end
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
    # binding.pry
    end
    @defect.save

    respond_to do |format|
      format.html
      format.js
    end
  end

  def get_search_result
    
@defect = Defect.find_all_by_def_description(params[:id])

respond_to do |format|
      format.html
      format.js
    end
  end

end
