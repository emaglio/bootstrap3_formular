require_dependency 'post/operation/show'

class Comment::Create < Trailblazer::Operation
  step Nested(Post::Show)
  step Contract::Validate()
  step :check_errors!
  step Contract::Persist(method: :sync)


  def check_errors!(options, params:, **)
    !(params[:comments].last[:body] == "" or params[:comments].last[:weight] == nil)
  end

end # class Comment::Create
