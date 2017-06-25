require 'reform/form/dry'
require 'disposable/twin/property/hash'
require 'disposable/twin/property/unnest'

module Comment::Contract
  class New < Reform::Form
    feature Reform::Form::Dry
    property :body
    property :weight

    validate do
      required(:body).filled
      required(:weight).filled
    end

    property :post,
      prepopulator: ->(options) { self.post = Post.find_by(id: params[:post_id]) },
      populator: :populate_comments! do
        property :title
        property :subtitle
        property :body
    end

    property :user, prepopulator: ->(options) { self.user = User.find_by(email: options[:user_email]) } do
      property :email
    end

  private
    def populate_comments!(collection:, index:, **)
      if item = collection[index]
        item
      else
        collection.insert(index, Song.new)
      end
    end
  end
end
