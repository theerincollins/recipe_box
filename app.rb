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
  title = params.fetch("title")
  @new_recipe = Recipe.new(title: title, instructions: params.fetch("instructions"))
  if @new_recipe.save()
    @recipe_id = @new_recipe.id
    # ingredient_id = params.fetch("ingredient_ids").to_i()
    # @ingredients = Ingredient.find(ingredient_id)
    # if @ingredients.save()
      redirect("/recipes/".concat(@recipe_id))
    # else
    #   erb(:index)
    # end
  end
end

get('/recipes/') do
  @recipe = Recipe.find(params.fetch("id").to_id())
  erb(:recipe)
end



# post('/recipes') do
#
# end
