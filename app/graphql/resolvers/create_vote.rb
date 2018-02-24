class Resolvers::CreateVote < GraphQL::Function
  argument :linkId, !types.ID

  type Types::VoteType

  def call(_obj, args, ctx)
    Vote.create!(
      user: ctx[:current_user],
      link_id: args[:linkId]
    )
  end
end
