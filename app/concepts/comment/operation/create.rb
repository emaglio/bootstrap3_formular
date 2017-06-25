require_dependency 'post/operation/show'

class Comment::Create < Trailblazer::Operation
  step Nested(Post::Show)
  step Contract::Validate()
  step Contract::Persist(method: :sync)
  # step :save_comment!

  def save_comment!(options, *)
  end
end # class Comment::Create
