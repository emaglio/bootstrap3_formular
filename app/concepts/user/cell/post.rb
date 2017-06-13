module User::Cell

  class Post < Trailblazer::Cell
    def link
      link_to model.title, user_post_path(model, model.user_id) unless model == nil
    end
  end # class Item

end # module User::Cell
