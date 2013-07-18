class LoginController < ApplicationController
  # GET /posts/1
  # GET /posts/1.json
  def show
    redirect_to :controller => 'posts', :action => "index"
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @login = Login.new
  end

  # POST /posts
  # POST /posts.json
  def create
    require 'digest/sha1'

    @login = Login.new(params[:login])
    password = Digest::SHA1.hexdigest @login.password
    @login.password = password
    
    # @people = Person.new(:agent=>@login.user)
    # @people.save
    
    respond_to do |format|
      if @login.save
        format.html { redirect_to @login, notice: 'Login was successfully created.' }
        format.json { render json: @login, status: :created, location: @login }
      else
        format.html { render action: "new" }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  def index

    redirect_to :action => "new"
  end

  def update
    redirect_to :controller => 'posts', :action => "index"
  end

end
