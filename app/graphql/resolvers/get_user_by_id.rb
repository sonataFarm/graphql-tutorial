class Resolvers::GetUserById < GraphQL::Function
  argument :id, !types.ID

  type Types::UserType

  def call(_obj, args, ctx)
    User.find_by(id: args[:id])
  end
end
