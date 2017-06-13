module Post::Cell

  class Item < New

    def link
      link_to model.title, user_post_path(id: model.id, user_id: current_user.id ) unless model == nil
    end
  end # class Index

end # module Post::Cell
