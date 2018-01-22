Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  # queries are just represented as fields
  field :allLinks, !types[Types::LinkType] do
    resolve -> (obj, args, ctx) { Link.all }
  end
end
