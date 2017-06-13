class User::AllPosts < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = Post.all
  end

end # class User::AllPosts
