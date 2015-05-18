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
  @one_star = Rating.find(1)
  @two_star = Rating.find(2)
  @three_star = Rating.find(3)
  @four_star = Rating.find(4)
  @five_star = Rating.find(5)
  @category = Category.find(params.fetch("id").to_i)
  @types = Type.all
  erb(:recipe_form)
end


get('/add/ingredients') do
  @ingredients = Ingredient.all()
  @types = Type.all()
  erb(:ingredient_form)
end

post('/ingredients') do
  @types = Type.all()
  description = params.fetch("description")
  type_id = params.fetch("type_id").to_i
  Ingredient.create(description: description, type_id: type_id)
  erb(:ingredient_form)
end

patch('/recipes/:id') do
  recipe_id = params.fetch("id").to_i()
  @recipe = Recipe.find(recipe_id)
  if params.has_key?("instructions")
    instructions = params.fetch("instructions")
    @recipe.update({:instructions => instructions})
  end
  redirect("/recipes/".concat(@recipe.id().to_s))
end


delete('/recipes/:id') do
  recipe_id = params.fetch("id").to_i()
  recipe = Recipe.find(recipe_id)
  category_id = recipe.categories.ids
  recipe.destroy()
  @recipes = Recipe.all()
  redirect("/")
end

get("/categories/:id") do
  @category = Category.find(params.fetch(category_ids))
  erb(category)
end

get('/recipes/update/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  erb(:recipe_update)
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
  @one_star = Rating.find(1)
  @two_star = Rating.find(2)
  @three_star = Rating.find(3)
  @four_star = Rating.find(4)
  @five_star = Rating.find(5)
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
  rating = params.fetch("rating").to_i
  prep_time = params.fetch("prep_time").to_i
  cook_time = params.fetch("cook_time").to_i
  @new_recipe = Recipe.create(title: title, instructions: params.fetch("instructions"),
  category_ids: [category_id], ingredient_ids: ingredient_ids_integer,
  rating_id: rating, prep_time: prep_time, cook_time: cook_time)
  redirect("/recipes/".concat(@new_recipe.id().to_s))
end


get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe)
end

get('/categories') do
  @categories = Category.all
  erb(:categories)
end

get('/dinner') do
  @recipes_to_make = Ingredient.can_make
  erb(:dinner_results)
end
