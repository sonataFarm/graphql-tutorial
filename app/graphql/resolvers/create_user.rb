class Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :login_info, Types::AuthProviderEmailInput
  end

  argument :name, !types.String
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      name: args[:name],
      email: args[:authProvider][:login_info][:email],
      password: args[:authProvider][:login_info][:password]
    )
  end
end
