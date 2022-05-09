class PostRepository 
  
  class << self
    
    def index
      @posts =Post.all
    end

    def import(file)
      Post.import(file)
    end

    def new
      @post = Post.new
    end

    def create(post)
      @post = Post.new(post)
      isSave = @post.save
    end

    def create_post(post)
      @post = Post.new(post)
    end

    def find_by_id(id)
      @post = Post.find(id)
    end

    def update(post,post_update)
      isUpdate = post.update(post_update)
    end

    def destroy(post)
      post.destroy
    end

  private
  
    def post_params
      params.require(:post).permit(:title, :description, :status, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end

  end

end