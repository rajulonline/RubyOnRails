class PersonController < ApplicationController
  # GET /posts
  # GET /posts.json
  

  # GET /posts/new
  # GET /posts/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  
  
  
  
  
end
