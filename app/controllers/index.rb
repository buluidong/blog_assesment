get '/' do
  # Look in app/views/index.erb
   @post = Post.all
   @tag = Tag.all


     erb :index
end

