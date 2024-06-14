desc 'Generate a report of users who logged in during the last week'
namespace :db do
  namespace :seed do
    task file: :environment do
      # Your task logic here
      fullpath = File.join(Rails.root, 'db', 'seeds', "#{ENV['SEED_FILE']}.rb")

      load(fullpath) if File.exist?(fullpath)
    end
  end
end
