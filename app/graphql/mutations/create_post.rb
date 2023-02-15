class Mutations::CreatePost < GraphQL::Schema::Mutation
  description "Create an Post"

  null true

  argument :post, Types::PostInputType, required: false

  argument :id, ID, required: false
  argument :title, String, required: false
  argument :body, String, required: false

  def resolve(post: nil, id: nil, title: nil, body: nil)
    if post
      Post.create(post.to_h)
    else
      Post.create(title: title, body: body)
    end
  end
end
