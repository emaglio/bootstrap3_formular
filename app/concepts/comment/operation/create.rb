
class Comment::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Comment, :new)
    step Contract::Build(constant: Comment::Contract::New)
    step :prepopulate!

    def prepopulate!(options, current_user:, params:, **)
      return false if !current_user
      options["contract.default"].prepopulate!(user_email: current_user.email, post: params[:id])
    end
  end

  step Nested( Present )
  step Contract::Validate()
  step :check_errors!
  step Contract::Persist(method: :sync)


  def check_errors!(options, params:, **)
    !(params[:comments].last[:body] == "" or params[:comments].last[:weight] == nil)
  end

end # class Comment::Create
