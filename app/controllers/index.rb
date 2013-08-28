get '/' do
  @all_urls = Url.order("id DESC")
  erb :index
end

post '/urls' do
  url = Url.new(original: params[:long_url])
  if url.save
    redirect '/'
  else
    @errors = url.errors.full_messages
    erb :index
  end
end

get '/:short_url' do
  url = Url.where(shortened: params[:short_url]).first
  url.update_attribute(:counter, url.counter + 1)
  redirect "#{url.original}"
end










# To Do:
# normalize original before saving (prepend http://) DONE
# add click counter to database and increment it in controllers (and display it in views?) DONE

# ensure we return the same short url when we put a long url in (i.e. don't generate a new one for google every time)
# make the home page into a table maybe.
# error handling, validations..

# validate url
# /^[a-zA-Z0-9\-\.]+\.(com|org|net|mil|edu|COM|ORG|NET|MIL|EDU)$/

