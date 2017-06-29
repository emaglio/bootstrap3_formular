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

    property :post, readonly: true
    property :user, readonly: true

  end
end
