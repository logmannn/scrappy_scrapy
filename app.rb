require("bundler/setup")
require("open-uri")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @page = Nokogiri::HTML(open("https://www.indeed.com/jobs?q=jr+developer&l=Portland%2C+OR"))

  #foreach page do the result
  #go to that page and get the links to the pages

  @amount_of_jobs = @page.css('#searchCount').to_s
  @amount_of_jobs =~ /Page 1 of (.*?) jobs/
  @amount_of_jobs = $1
#.gsub(/Page 1 of /, '').gsub(/ jobs/, '')
  @amount_of_pages = @amount_of_jobs.to_i/14


  #grab the first page and then change the link to have this at the end: &start=10
  @page_stuff = @page.css('.row')


  erb(:home)
end

# # home page
# get('/') do
#   @stores = Store.all
#   @brands = Brand.all
#   # @shoes = Item.all
#   erb(:home)
# end
#
# get '/stores' do
#   @stores = Store.all
#   erb(:stores)
# end
#
# post('/stores')do
#   name = params[:title]
#   if name != ""
#     @store = Store.find_or_create_by({:name => name.capitalize})
#   end
#   @stores = Store.all
#   erb(:stores)
# end
#
# get '/brands' do
#   @brands = Brand.all
#   erb(:brands)
# end
#
# post('/brands')do
#   name = params[:title]
#   price = params[:price]
#   if name != ""
#     @brand = Brand.find_or_create_by({:name => name.capitalize, :price => price})
#   end
#   @brands = Brand.all
#   erb(:brands)
# end
#
# delete '/store/:id/delete' do
#   @store = Store.find(params.fetch("id").to_i)
#   @store.delete
#   @stores = Store.all
#   @brands = Brand.all
#   @shoes = Item.all
#   erb(:home)
# end
#
# patch '/store/:id/edit' do
#   title = params.fetch("edit")
#   @stores = Store.find(params.fetch("id").to_i())
#   @stores.update({:name => title})
#   @stores = Store.all
#   @brands = Brand.all
#   # @shoes = Item.all
#   erb(:home)
# end
#
# get '/store/:id/view' do
#   @brands = Brand.all
#   @stores = Store.all
#   erb(:store)
# end
#
# post '/store/:id/view' do
#   @store = Store.find(params.fetch("id").to_i)
#   @stores = Store.all
#   @brands = Brand.all - @store.brands
#   @store_brands = @store.brands
#   erb(:store)
# end
#
# get('/store/:id/view')do
#   @store = Store.find(params.fetch("id").to_i())
#   @brands = Brand.all - @store.brands
#   @store_brands = @store.brands
#   erb(:store)
# end
#
# patch '/store/:id/view' do
#   @store = Store.find(params.fetch("id").to_i())
#   brand_ids = params['brand_ids'] || [] # 'or' statement, returns empty array if no brands checked
#   brand_ids.each do |brand_id|
#     new_brand = Brand.find(brand_id)
#     @store.brands.push(new_brand)
#   end
#   @brands = Brand.all - @store.brands
#   @store_brands = @store.brands
#   erb(:store)
# end
#
# get '/brand/:id' do
#   @brand = Brand.find(params.fetch("id").to_i())
#   erb(:brand)
# end
