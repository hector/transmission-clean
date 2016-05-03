every 1.hour do
  command "cd #{Dir.pwd} && bundle exec ./clean.rb"
end