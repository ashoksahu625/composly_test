class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]


	def index
		if user_signed_in?
			@posts = current_user.posts
		else
		  @posts = Post.all
		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params.merge(user_id: current_user.id))
		if @post.save
	      respond_to do |format|  
            format.js { render 'users/show'}
          end  
	    else
	      render :new, status: :unprocessable_entity
	    end
	end

	def show
	end

	def edit
	end

	def update
		if @post.present?
		   if @post.update(post_params)
		      respond_to do |format|  
	            format.js { render 'users/show'}
	          end 
		    else
		      render :edit, status: :unprocessable_entity
		    end
		end
	end

	def destroy
		if @post.present?
		   @post.destroy
		   redirect_to root_path, status: :see_other
		end
	end

	private

	def find_post
		@post = Post.find_by_id(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :user_id, :author_type)
	end
end
