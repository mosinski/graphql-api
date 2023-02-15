class Mutations::UpdatePost < GraphQL::Schema::Mutation
  description "Update an Post"

  null true

  argument :post, Types::PostInputType, required: false

  argument :id, ID, required: false
  argument :title, String, required: false
  argument :body, String, required: false

  def resolve(post: nil, id: nil, title: nil, body: nil)
    if post
      record = Post.find_by(id: post[:id])
      record&.update(post.to_h.except(:id))
      record&.reload
    else
      record = Post.find_by(id)
      record&.update(title: title, body: body)
      record&.reload
    end
  end
end
