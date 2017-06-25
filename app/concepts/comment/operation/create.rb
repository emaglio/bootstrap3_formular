require_dependency 'post/operation/show'

class Comment::Create < Trailblazer::Operation
  step Nested(Post::Show)
  step Contract::Validate()
  step Contract::Persist()
end # class Comment::Create
