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
    property :avatar, virtual: :true

    extend Paperdragon::Model::Writer
    processable_writer :logo

    property :avatar_meta_data

    validation  do
      required(:email).filled
      required(:password).filled
      required(:confirm_password).filled
      required(:avatar).filled
    end
  end
end
