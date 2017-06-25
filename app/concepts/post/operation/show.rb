class Post::Show < Trailblazer::Operation
  step Model(Post, :find_by)
  step Contract::Build(constant: Post::Contract::Show)
  step :prepopulate!

  def prepopulate!(options, current_user:, **)
    return true if !current_user
    options["contract.default"].prepopulate!(user_email: current_user.email)
  end
end # class User::New
