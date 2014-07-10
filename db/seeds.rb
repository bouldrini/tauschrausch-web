require File.expand_path('lib/tasks/address_generator')
# require File.expand_path('lib/tasks/zip_to_geo_germany')

if ENV["FILE"].present?
  print "seeding #{ENV['FILE']}.rb"
  eval(File.new(Rails.root.join('db', 'seeds', "#{ENV['FILE']}.rb")).read)
else
  Dir[Rails.root.join('db', 'seeds', "*.rb")].sort.each do |file|
    if ENV["ERRORS"] == true
      puts "seeding #{file}"
    end
    eval(File.new(Rails.root.join('db', 'seeds', "#{file}")).read)
  end
end

