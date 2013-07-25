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
 
end
