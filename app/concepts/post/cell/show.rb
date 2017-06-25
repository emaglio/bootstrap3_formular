module Post::Cell

  class Show < New

    def post
      Post.find_by(id: params[:id])
    end

  end # class Show

end # module Post::Cell
