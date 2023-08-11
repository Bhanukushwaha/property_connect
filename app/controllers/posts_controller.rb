class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		if current_user.role == "customer"
		 @post = Post.new
		else
      redirect_to(request.referer)
    end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
    if @post.save		
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
	end

	 def update
	 	@post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, status: :see_other
  end


	private
	def post_params
		params.require(:post).permit(:name, :email, :phone_number, :city, :price, :address, :property_type, :transaction_type, :user_id)
	end
end