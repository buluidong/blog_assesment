
post '/posts' do
  # Look in app/views/index.erb
  @post = Post.create(params[:post])
  params[:tag][:name].split(", ").each do |tag_name|

    # @tag = Tag.find_by_name(tag_name)
    # if @tag.nil?
    #   @tag = Tag.create(name: tag_name)
    # end

    @tag = Tag.find_or_create_by_name(tag_name)
    @entry = Entry.create(post_id: @post.id, tag_id: @tag.id)
  end

  redirect to('/')
end

# index
get '/posts' do
  @post = Post.all
  @tag = Tag.find_by_id(params[:id])
  erb :posts
end

# delete
delete '/posts' do
  Post.find(params[:id]).destroy
  redirect to('/posts')
end

# Edit
get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  @tags = @post.tags

  @post.update_attributes(params[:post])

  erb :edit
end

# Show
get '/posts/:id' do
  @post = Post.find(params[:id])

  erb :one
end

put '/posts/:id' do
  @post = Post.find(params[:id])


  @post.update_attributes(params[:post])
  @post.save
  redirect to('/posts')
end

