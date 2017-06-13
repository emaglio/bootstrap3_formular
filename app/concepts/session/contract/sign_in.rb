require 'reform/form/dry'

module Session::Contract
  class SignIn < Reform::Form
    feature Reform::Form::Dry
    undef :persisted?
    attr_reader :user

    property :email,    virtual: true
    property :password, virtual: true

    validation with: { form: true } do
      configure do
        config.messages_file = 'config/error_messages.yml'

        def user
          return User.find_by(email: form.email)
        end

        def user_exists?
          return user != nil
        end

        def password_ok?
          Tyrant::Authenticatable.new(user).digest?(form.password) == true if user != nil
        end
      end

      required(:email).filled(:user_exists?)
      required(:password).filled

      #verify password only if it has been filled first
      validate(password_ok?: :password) do
        password_ok?
      end
    end
  end
end
