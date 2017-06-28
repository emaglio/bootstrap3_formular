require 'reform/form/dry'
require 'disposable/twin/property/hash'
require 'disposable/twin/property/unnest'

module Post::Contract
  class New < Reform::Form
    feature Reform::Form::Dry

    property :title
    property :subtitle
    property :body

    validation  do
      required(:title).filled
      required(:body).filled
    end

    property :user, prepopulator: ->(options) { self.user = User.find_by(email: options[:user_email]) } do
      property :email
    end
  end
end
