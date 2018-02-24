Types::LoginInfoInput = GraphQL::InputObjectType.define do
  name 'LOGIN_INFO'

  argument :email, !types.String
  argument :password, !types.String
end
