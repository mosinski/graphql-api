# GraphQL example app

# Table of Contents
1. [Setup Project](#setup)
2. [Testing with GraphiQL](#testing-with-graphiql)
3. [Example Queries](#example-queries)
    1. [Single Post](#single-post)
    2. [Collection of Posts](#collection-of-posts)
4. [Example Mutations](#example-mutations)
    1. [Create Post](#create-post)
    2. [Update Post](#update-post)
    3. [Delete Post](#delete-post)

## Setup
```
bundle
rails db:setup
rails s
```

## Testing with GraphiQL
```
brew install --cask graphiql
```

## Example Queries

### Single Post
```
{
  post(id: "12d08a32-1cee-4681-84d0-4ef45a51203b") {
    id
    title
    body
  }
}
```

### Collection of Posts
```
{
  posts {
    id
    title
    body
  }
}
```

## Example Mutations

### Create Post

#### As inline arguments
```
mutation {
  createPost(title:"New Post", body: "Another fantastic Post") {
    id
    title
    body
  }
}
```

#### As separate variables
```
mutation createPost($title:String!, $body:String!) {
  createPost(title: $title, body: $body) {
    id
    title
    body
  }
}

{
  "title": "New Post",
  "body": "Another fantastic Post"
}
```

#### As input type
```
mutation createPost($post:PostInputType!) {
  createPost(post: $post) {
    id
    title
    body
  }
}

{
  "post": {
    "title": "New Post",
    "body": "Another fantastic Post"
  }
}

```

### Update Post

#### As inline arguments
```
mutation {
  updatePost(id: "12d08a32-1cee-4681-84d0-4ef45a51203b", title:"Updated Post", body: "Updated Body") {
    id
    title
    body
  }
}
```

#### As separate variables
```
mutation updatePost($title:String!, $body:String!) {
  updatePost(title: $title, body: $body) {
    id
    title
    body
  }
}

{
  "id": "12d08a32-1cee-4681-84d0-4ef45a51203b",
  "title": "Updated Post",
  "body": "Updated Body"
}
```

#### As input type
```
mutation updatePost($post:PostInputType!) {
  updatePost(post: $post) {
    id
    title
    body
  }
}

{
  "post": {
    "id": "12d08a32-1cee-4681-84d0-4ef45a51203b",
    "title": "Updated Post",
    "body": "Updated Body"
  }
}

```

### Delete Post

#### As inline arguments
```
mutation {
  deletePost(id: "12d08a32-1cee-4681-84d0-4ef45a51203b") {
    id
  }
}
```

#### As separate variables
```
mutation deletePost($id:ID!) {
  deletePost(id: $id) {
    id
  }
}

{
  "id": "12d08a32-1cee-4681-84d0-4ef45a51203b",
}
```

#### As input type
```
mutation deletePost($post:PostInputType!) {
  deletePost(post: $post) {
    id
  }
}

{
  "post": {
    "id": "12d08a32-1cee-4681-84d0-4ef45a51203b",
  }
}

```
