require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  new_category = Category.create(description: "Late Night Snicky Snack")
  @categories = Category.all()
  erb(:index)
end

get('/categories/:id') do
  @category = Category.find(params.fetch("id").to_i)
  erb(:category)
end

get('/recipe/add/category/:id') do
  @category = Category.find(params.fetch("id").to_i)
  erb(:recipe_form)
end

get('/add/ingredients') do
  @ingredients = Ingredient.all()
  @types = Type.all()
  erb(:ingredient_form)
end


# post('/recipes') do
#
# end
