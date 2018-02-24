Types::LinkType = GraphQL::ObjectType.define do
  name 'Link'

  field :id, !types.ID
  field :url, !types.String
  field :description, !types.String
  field :author, Types::UserType, property: :author
  field :votes, !types[Types::VoteType]
end
