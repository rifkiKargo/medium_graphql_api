defmodule MediumGraphqlApiWeb.Resolvers.CommentResolver do
  alias MediumGraphqlApi.Blog

  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do
    comment_input = Map.merge(input, %{user_id: current_user.id})
    x = Blog.create_comment(comment_input)
    IO.inspect(x)
  end
end
