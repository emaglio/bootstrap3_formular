require 'reform/form/dry'
require 'disposable/twin/property/hash'
require 'disposable/twin/property/unnest'

module Post::Contract
  class Show < Reform::Form
    feature Reform::Form::Dry
    include Disposable::Twin::Property::Hash

    property :title, writable: false
    property :subtitle, writable: false
    property :body, writable: false

    collection :comments,
      prepopulator: ->(options) { self.comments << Comment.new },
      populate_if_empty: Comment.new do
        property :body
        property :weight

        validate do
          required(:body).filled
          required(:weight).filled
        end
    end

    property :user, prepopulator: ->(options) { self.user = User.find_by(email: options[:user_email]) } do
      property :email
    end
  end
end
