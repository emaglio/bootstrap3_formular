require 'reform/form/dry'
require 'disposable/twin/property/hash'
require 'disposable/twin/property/unnest'

module Post::Contract
  class New < Reform::Form
    feature Reform::Form::Dry
    include Disposable::Twin::Property::Hash

    property :title
    property :subtitle
    property :body
    property :user_id

    validation  do
      required(:title).filled
      required(:body).filled
    end

    property :user, prepopulator: ->(options) { self.email = options[:user_email]} do
      property :email
    end
  end
end
