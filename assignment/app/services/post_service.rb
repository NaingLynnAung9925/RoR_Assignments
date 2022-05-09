class PostService
  
  class << self
    
    def index
      PostRepository.index
    end
    
    def new
      PostRepository.new
    end

    def save(post)
      isSave = PostRepository.create(post)
    end

    def create_post(post)
      PostRepository.create_post(post)
    end

    def update(id,post_update)
      @post = PostRepository.find_by_id(id)
      isUpdate = PostRepository.update(@post,post_update)
    end

    def destroy(id)
      @post = PostRepository.find_by_id(id)
      PostRepository.destroy(@post)
    end

    def set_post(id)
      PostRepository.find_by_id(id)
    end

  end

end