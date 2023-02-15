module Types
  class MutationType < Types::BaseObject
    field :create_post, Types::PostType, mutation: Mutations::CreatePost
    field :update_post, Types::PostType, mutation: Mutations::UpdatePost
    field :delete_post, Types::PostType, mutation: Mutations::DeletePost
  end
end
