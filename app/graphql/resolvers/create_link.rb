class Resolvers::CreateLink < GraphQL::Function
  # arguments passed as "args"
  argument :description, !types.String
  argument :url, !types.String

  # return type from the mutation
  type Types::LinkType

  # the mutation method
  # _obj - is the parent object, in this case nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which will be discussed later)
  def call(_obj, args, ctx)
    Link.create!(
      description: args[:description],
      url: args[:url]
      user: ctx[:current_user]
    )
  end
end
