class User::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = User.all
  end

end # class User::Index
