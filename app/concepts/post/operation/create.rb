require_dependency 'post/operation/new'

class Post::Create < Trailblazer::Operation
  step Nested(Post::New)
  step Contract::Validate()
  step Contract::Persist()
end # class Post::Create
