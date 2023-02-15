module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :post, Types::PostType, null: true, description: "Returns one Post instance" do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find_by(id: id)
    end

    field :posts, [Types::PostType], null: true, description: "Returns collection of Posts"

    def posts
      Post.all
    end
  end
end
