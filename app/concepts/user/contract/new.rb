require 'reform/form/dry'

module User::Contract
  class New < Reform::Form
    feature Reform::Form::Dry

    property :email
    property :firstname
    property :lastname
    property :gender
    property :dob
    property :block
    property :password, virtual: true
    property :confirm_password, virtual: true
    property :auth_meta_data
    property :avatar, virtual: :true

    extend Paperdragon::Model::Writer
    processable_writer :avatar

    property :avatar_meta_data

    validation with: {form: true}  do
      configure do
        config.messages_file = 'config/error_messages.yml'

        def unique_email?
          User.where("email = ?", form.email).size == 0
        end
      end

      required(:email).filled(:unique_email?)
      required(:password).filled
      required(:confirm_password).filled
    end
  end
end
