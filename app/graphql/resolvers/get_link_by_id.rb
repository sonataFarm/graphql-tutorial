class Resolvers::GetLinkById < GraphQL::Function
  argument :id, !types.Int

  type Types::LinkType

  def call(_obj, args, _ctx)
    Link.find_by(id: args[:id])
  end
end
