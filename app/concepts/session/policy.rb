class Session::Policy

  def initialize(user, model)
    @user = user
    @model = model
  end

  def true?
    true
  end

  def post_owner?
    return unless @user
    return true if @model.user_id == -1 # this is to edit the report template
    @user.id == @model.user_id
  end

  def admin?
    return unless @user
    @user.email == "admin@email.com"
  end

  def update_delete_post?
    post_owner? or admin?
  end

  def current_user?
    return unless @user
    @user.email == @model.email
  end

  def signed_in?
    @user
  end

  def show_block_user?
    current_user? or admin?
  end
end
