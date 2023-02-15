class Mutations::DeletePost < GraphQL::Schema::Mutation
  description "Delete an Post"

  null true

  argument :post, Types::PostInputType, required: false

  argument :id, ID, required: false

  def resolve(post: nil, id: nil)
    if post
      Post.find_by(id: post[:id])&.destroy
    else
      Post.find_by(id)&.destroy
    end
  end
end
