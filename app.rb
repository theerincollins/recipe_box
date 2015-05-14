require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
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

get('/add/categories') do
  @categories = Category.all()
  erb(:category_form)
end

post('/categories') do
  @new_category = Category.create(description: params.fetch("description"))
  redirect("/categories/".concat(@new_category.id().to_s).concat("/recipes/add"))
end

get('/categories/:id/recipes/add') do
  @category = Category.find(params.fetch("id"))
  @types = Type.all()
  erb(:recipe_form)
end

post('/recipes') do
  ingredient_ids_integer = []
  ingredient_ids = params.fetch("ingredient_ids")
    ingredient_ids.each() do |id|
      ingredient_ids_integer.push(id.to_i())
    end
  ingredient_ids_integer
  title = params.fetch("title")
  category_id = params.fetch("category_id")
  @new_recipe = Recipe.create(title: title, instructions: params.fetch("instructions"), category_ids: [category_id], ingredient_ids: ingredient_ids_integer)
  redirect("/recipes/".concat(@new_recipe.id().to_s))
end



get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe)
end



# post('/recipes') do
#
# end
