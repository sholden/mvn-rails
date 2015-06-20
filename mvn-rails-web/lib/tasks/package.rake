namespace :package do
  task :war => ['assets:precompile', 'rake:war']
end