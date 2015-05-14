require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  new_category = Category.create(description: "Morning Munchies")
  @categories = Category.all()
  erb(:index)
end

get('/categories/:id') do
  @category = Category.find(params.fetch("id").to_i)
  erb(:category)
end

get('/recipe/add/category/:id') do
  @category = Category.find(params.fetch("id").to_i)
  @types = Type.all
  erb(:recipe_form)
end

get('/add/ingredients') do
  @ingredients = Ingredient.all()
  @types = Type.all()
  erb(:ingredient_form)
end

post('/recipes') do
  ingredient_ids = params.fetch("ingredient_ids").to_a
  title = params.fetch("title")
  category_id = params.fetch("category_id")
  @new_recipe = Recipe.create(title: title, instructions: params.fetch("instructions"), category_ids: [category_id], recipe_ids: ingredient_ids)
  @ingredients = ingredients
  redirect("/recipes/".concat(@new_recipe.id().to_s))
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe)
end



# post('/recipes') do
#
# end
