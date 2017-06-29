class Post::Create < Trailblazer::Operation

  class Present < Trailblazer::Operation
    step Model(Post, :new)
    step Contract::Build(constant: Post::Contract::New)
  end # class Present

  step Nested( Present )
  step Contract::Validate()
  step Contract::Persist()
end # class Post::Create
