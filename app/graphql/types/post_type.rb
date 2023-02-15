class Types::PostType < Types::BaseObject
  description "Single Blog Post"

  field :id, ID, null: false, description: "Identifier of Post"
  field :title, String, null: false, description: "Title of Post"
  field :body, String, null: false, description: "Body of Post"
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: "Date time of Post"
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: "Body of Post"
end

class Types::PostInputType < GraphQL::Schema::InputObject
  graphql_name "PostInputType"
  description "All attributes needed to create / update Post"

  argument :id, ID, required: false
  argument :title, String, required: false
  argument :body, String, required: false
end
