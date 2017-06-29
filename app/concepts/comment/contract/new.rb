require 'reform/form/dry'

module Comment::Contract
  class New < Reform::Form
    feature Reform::Form::Dry
    property :body
    property :weight
    property :public

    validation do
      required(:body).filled
      required(:weight).filled
    end

    property :post, prepopulator: ->(options) { self.post = Post.find_by(id: options[:post]) } do
    end

    property :user, prepopulator: ->(options) { self.user = User.find_by(email: options[:user_email]) } do
      property :email
    end
  end
end
