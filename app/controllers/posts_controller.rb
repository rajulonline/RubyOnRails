class PostsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index]
  # GET /posts
  # GET /posts.json
  def index
    @project = Project.all
    # @post = Post.all
    # @children = Children.all
    cache_everything
    # cache = ActiveSupport::Cache::MemoryStore.new
    # @stats = Rails.cache.stats.first.last

    if @post.nil?
      flash[:notice]='There are no test cases'
    end
    @post = Post.paginate :page => params[:page], :per_page => 5, :order => 'agent ASC'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end

  def get_test_case
    #@project = Project.where("name=?",params[:id]).all
    @project = Project.find_by_name(params[:id])
    if @project.nil?
      @post=Post.all
    else
      @post = Post.find_all_by_project_id(@project.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end

  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @project = Project.all
    @requirement=Requirement.all
    @login=Login.all
    @status = Status.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @login = Login.all
    @status = Status.all
    @project = Project.all
    @requirement=Requirement.all
  end

  # POST /posts
  # POST /posts.json

  def create

    @login = Login.all
    @status = Status.all
    @project = Project.all
    @requirement=Requirement.all

    # @person = Person.new(:agent => @post.agent, :status=>@post.status)
    # @person.save
    if request.post?
      #before saving the parent test case details i am actually,
      #finding the id for the corresponding requirement and then
      #saving it in the posts table. The piece of code from post_new till @post
      # does it
      @post = Post.new(params[:post])
      if params[:post][:req_name].present?
        post_new = Post.new(params[:post])
        req = Requirement.find_by_req_name([post_new.req_name])
        req.id
        post_new.req_id= req.id
        @post = post_new
      end

    end

    respond_to do |format|
      if @post.save
        format.html {
          flash[:notice] = 'Test Case was successfully created.'
          redirect_to @post
        }
        format.json { render json: @post,status: :created, location: @post }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to :action => "index", notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # @post=Post.find_all_by_parent_tc_id(:id)
    @post = Post.find(params[:id])
    @children=Children.find_all_by_parent_tc_id(:parent_tc_id)
    @defect=Defect.find_all_by_parent_tc_id(:parent_tc_id)
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def all_agent

    customer= Login.find_by_user(params[:id])
    if customer.nil?
      redirect_to :action => 'index'
      flash[:notice]='We dont have the agent you selected any more in the database'
    else
      agent_name = customer.user
      @post = Post.find_all_by_agent(agent_name)
    end
  end

  def all_status

    testcase_status= Post.find_by_status(params[:id])
    if testcase_status.nil?
      redirect_to :action => "index", notice: 'No test case with this status.'
    else
      status_name = testcase_status.status
      @post = Post.find_all_by_status(status_name)
    end
  end

  def all_test_cases
    post=Post.find_all_by_parent_tc_id(:id)
    children=Children.find_all_by_parent_tc_id(:id)
  end

  def all_project_test_cases

    @all_posts = Post.find_all_by_project_id(params[:id])
    if @all_posts.nil?
      flash[:notice] = 'No test cases available for this project'
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all_posts }
    end
  end

  def get_requirement_list
    @requirement = Requirement.find_all_by_project_id(params[:id])

    if @requirement.nil?
      @requirement = []
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
