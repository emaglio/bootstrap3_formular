require_dependency 'user/operation/new'

class User::Create < Trailblazer::Operation
  step Nested(::User::New)
  step Contract::Validate()
  step :upload_image!
  step Contract::Persist()
  step :create!

  def upload_image!(options, *)
    return true if options["contract.default"].avatar == nil
    options["contract.default"].avatar!(options["contract.default"].avatar) do |v|
      v.process!(:thumb) { |job| job.thumb!("120x120#") }
    end
  end

  def create!(options, model:, params:, **)
    auth = Tyrant::Authenticatable.new(model)
    auth.digest!(params[:password]) # contract.auth_meta_data.password_digest = ..
    auth.confirmed!
    auth.sync
    model.save
  end

end # class User::Create
