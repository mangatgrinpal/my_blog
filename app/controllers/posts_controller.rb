class PostsController < ApplicationController
	def index
	  @posts = Post.all.order('created_at DESC')
	end

	def new
	  @post = Post.new
	end

	def create
      @post = Post.new(post_params)
      
      if @post.save
      	redirect_to @post
      else
      	render 'new' 

      	#render instead of redirect, because redirect would do an entirely
      	#new http request and reset the page, losing unsubmitted blog post.
      end
	end

	def show
		@post = Post.find(params[:id])
	end

	private
	  def post_params
	  	params.require(:post).permit(:title, :body)
	  end
end
