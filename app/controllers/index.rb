get '/' do
  @categories = Category.all.map{ |c| c.category_name }.sort
  erb :index
end

get '/:category' do
	category = Category.where(category_name: "#{params[:category]}").first
  @category = params[:category]
	@postings = Posting.where(category_id: category.id)
	erb :posting
end

get '/:category/new' do
  @category = params[:category]
  erb :new_post
end

post '/:category/new' do
  category = Category.where(category_name: "#{params[:category]}").first
  Posting.create({title: params[:title], description: params[:description],
                  category_id: category.id})
  redirect to("/#{params[:category]}")
end

get '/posts/:id' do
  @post = Posting.find(params[:id].to_i)
  erb :post
end

get '/posts/:id/edit' do
  @post = Posting.find(params[:id].to_i)
  erb :edit
end

put '/posts/:id/edit' do
  @post = Posting.find(params[:id].to_i)
  Posting.update(@post.id, title: params[:title], description: params[:description])
  redirect to("/posts/#{@post.id}")
end