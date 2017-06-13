class Post::Index < Trailblazer::Operation
  step :model!

  def model!(options, current_user:, **)
    options["model"] = current_user.posts
  end

end # class Post::Index
