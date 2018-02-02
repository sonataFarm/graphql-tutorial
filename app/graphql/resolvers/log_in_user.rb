class Resolvers::LogInUser < GraphQL::Function
  argument :login_info, !Types::AuthProviderEmailInput

  type do
    name 'LoginPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, ctx)
    input = args[:login_info]
    return unless input

    user = User.find_by_email(input[:email])

    return unless user
    return unless user.authenticate(input[:password])

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{user.id}")
    ctx[:session][:token] = token
    
    OpenStruct.new({
      user: user,
      token: token
      })
  end
end
