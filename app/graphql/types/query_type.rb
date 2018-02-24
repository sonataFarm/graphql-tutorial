Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :getAllLinks, !types[Types::LinkType] do
    resolve -> (obj, args, ctx) { Link.all }
  end

  field :getLinkById, function: Resolvers::GetLinkById.new

  field :getAllUsers, !types[Types::UserType] do
    resolve -> (obj, args, ctx) { User.all }
  end

  field :getUserById, function: Resolvers::GetUserById.new
end
