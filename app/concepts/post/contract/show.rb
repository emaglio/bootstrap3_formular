require 'reform/form/dry'
require 'disposable/twin/property/hash'
require 'disposable/twin/property/unnest'

module Post::Contract
  class Show < Reform::Form
    feature Reform::Form::Dry

    collection :comments,
      prepopulator: ->(options) { self.comments = [Comment.new] },
      populator: :populate_comments! do
        property :body
        property :weight
        validation do
          required(:body).filled
          required(:weight).filled
        end
      property :user, prepopulator: ->(options) { self.user = User.find_by(email: options[:user_email]) } do
        property :email
      end
    end


  private
    def populate_comments!(collection:, index:, **)
      if item = collection[index]
        item
      else
        collection.insert(index, Comment.new)
      end
    end
  end
end
