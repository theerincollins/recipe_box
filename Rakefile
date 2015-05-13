require('sinatra/activerecord')
require('sinatra/activerecord/rake')

namespace(:db) do
  task(:load_config)
end

class Seeder
  def
    initialize(seed_file)
    @seed_file = seed_file
  end

  def load_seed
    raise "Seed file '#{@seed_fil}' does not
    exist" unless File.file?
    (@seed_file)
      load @seed_file
    end
  end
