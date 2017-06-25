module Post::Cell

  class Show < New

    def post
      Post.find_by(id: params[:id])
    end

    def comments
      post.comments
    end

  end # class Show

end # module Post::Cell
