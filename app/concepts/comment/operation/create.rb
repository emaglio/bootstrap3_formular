class Comment::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Comment, :new)
    step Contract::Build(constant: Comment::Contract::New)
  end

  step Nested( Present )
  step ->(options, params:, **) { options["contract.default"].post = Post.find(params[:post_id])}
  step ->(options, current_user:, **) { options["contract.default"].user = User.find(current_user.id)}
  step Contract::Validate()
  step Contract::Persist()

end # class Comment::Create
