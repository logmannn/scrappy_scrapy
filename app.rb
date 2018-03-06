require("bundler/setup")
require("open-uri")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  #craigslist
  @query = "developer"
  @clink = "https://portland.craigslist.org/search/jjj?query=#{@query}&s=0&sort=rel"
  @cpage = Nokogiri::HTML(open("#{@clink}"))
  @camount_of_jobs = ((@cpage.css('.totalcount').first).text).to_s
  @camount_of_pages = (@camount_of_jobs.to_i)/120

  @clinkmod = "https://portland.craigslist.org/search/jjj?query=#{@query}&s="
  @cpage_stuff = []
  @camount_of_pages.times do |i|
    @cpage = Nokogiri::HTML(open("#{@clinkmod}#{i*120}&sort=rel"))
    @cpage_stuff.push(@cpage.css('.result-info'))
  end
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
