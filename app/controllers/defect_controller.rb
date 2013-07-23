class DefectController < ApplicationController
  def defect_analysis
    @defect = Defect.find(:all)
   if !Defect.all.nil?
      @total_defects = @defect.count
      @reg_defect_count = Defect.find_all_by_category('Regression').count
      @unit_test_defect_count = Defect.find_all_by_category('UnitTest').count
      @def_severity = Defect.find_all_by_severity('Cosmetic Defect').count
     
      #@reg_defect_count = Defect.find_all_by_category('Regression').count  
  end
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
      # logger.error("----------------------#{@defect.valid?}")
      if @defect.valid?
        @defect.save
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
    end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

end
