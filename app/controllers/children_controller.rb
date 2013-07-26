class ChildrenController < ApplicationController
  def add_child_test_case

    @post = Post.find(params[:post])

  end

  def display_child_test_case

    # logger.error("__________#{request.post?}------------")

    post = params[:id]
    @post = Post.find((post))

    @children = Children.create(params[:children])
    @children.parent_tc_id  = @post.parent_tc_id
    @children.agent = @post.agent
    @children.save

    respond_to do |format|
      if @children != nil || @children != 'NULL'
        if @children.save
          format.html {
            flash[:notice] = 'Child Test Case was successfully created.'
          }

          format.json { render json: @children, status: :created, location: @children }
        else
          format.html { render action: "new" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def display_all_child_test_cases
    @children = Children.find(:all)
    if @children.nil?
      flash[:notice]='There are no child test cases'
    end

  end

  def edit_child_test_case

    if request.post?
      
      @post = Post.find(:all)
      @login = Login.select('DISTINCT user')
      @status = Status.find(:all)
      @post_param = Post.find_by_parent_tc_id(params[:parent_tc_id])
      @children = @post_param.childrens.find(params[:id])

    end
    @children.save
    respond_to do |format|
      format.html # index.html.erb
      format.js
    #render :update do |page| page.replace_html "div_id", :partial => "new_content"
    end
  end

  def update_child_test_case
    children = Children.find(params[:children]['id'])
    children.update_attributes(params[:children])
    #get all records
    @children = Children.all
    respond_to do |format|
      format.js
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # @post=Post.find_all_by_parent_tc_id(:id)
    @children = Children.find(params[:id])
    @children.destroy

    respond_to do |format|
      format.html {redirect_to :action=>'display_all_child_test_cases'}
     format.js
    end
  end

end

