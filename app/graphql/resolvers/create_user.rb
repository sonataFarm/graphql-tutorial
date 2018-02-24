class Resolvers::CreateUser < GraphQL::Function
  argument :name, !types.String
  argument :loginInfo, !Types::LoginInfoInput

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      name: args[:name],
      email: args[:loginInfo][:email],
      password: args[:loginInfo][:password]
    )
  end
end
