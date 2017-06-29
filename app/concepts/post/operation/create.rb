class Post::Create < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(Post, :new)
    step Contract::Build(constant: Post::Contract::New)
    step :prepopulate!

    def prepopulate!(options, current_user:, **)
      return false if !current_user
      options["contract.default"].prepopulate!(user_email: current_user.email)
    end
  end # class User::Present

  step Nested( Present )
  step Contract::Validate()
  step Contract::Persist()
end # class Post::Create
