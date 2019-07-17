defmodule MediumGraphqlApiWeb.Schema do
  use Absinthe.Schema
  alias MediumGraphqlApiWeb.Resolvers
  alias MediumGraphqlApiWeb.Schema.Middleware
  # import Types
  import_types(MediumGraphqlApiWeb.Schema.Types)

  query do
    @desc "get list of all users"
    field :users, list_of(:user_type) do
      # Resolver
      middleware(Middleware.Authorize, "user")
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "register new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "login a user and return a jwt token"
    field :login, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.SessionResolver.login/3)
    end

    @desc "create a post"
    field :create_post, type: :post_type do
      middleware(Middleware.Authorize, :any)
      arg(:input, non_null(:post_input_type))
      resolve(&Resolvers.PostResolver.create_post/3)
    end

    @desc "create a comment"
    field :create_comment, type: :comment_type do
      middleware(Middleware.Authorize, :any)
      arg(:input, non_null(:comment_input_type))
      resolve(&Resolvers.CommentResolver.create_comment/3)
    end
  end

  # subscription do
  # end
end
