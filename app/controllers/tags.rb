get '/tags/:id' do
  # Look in app/views/index.erb
  @tag = Tag.find(params[:id])

  erb :tag_posts
end


