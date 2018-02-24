class Resolvers::CreateSession < GraphQL::Function
  argument :loginInfo, !Types::LoginInfoInput

  type do
    name 'SessionPayload'

    field :user, Types::UserType
    field :token, types.String
  end

  def call(_obj, args, ctx)
    loginInfo = args[:loginInfo]
    return unless loginInfo

    user = User.find_by_credentials(
      loginInfo[:email],
      loginInfo[:password]
    )
    return unless user

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{user.id}")
    ctx[:session][:token] = token

    OpenStruct.new({
      user: user,
      token: token
    })
  end
end
