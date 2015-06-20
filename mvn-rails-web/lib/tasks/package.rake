begin
  require 'warbler'
  Warbler::Task.new

  namespace :package do
    task :war => ['assets:precompile', 'rake:war']
  end
rescue LoadError => e
  puts "Warbler not found"
end

