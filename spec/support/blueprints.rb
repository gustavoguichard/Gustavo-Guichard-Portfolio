require 'machinist/active_record'

random = Random.new

images_path = Rails.root + 'spec/support/images'

Project.blueprint do
  title      { Faker::Name.name }
  content     { Faker::Lorem.words(random.rand(3..8)).join(" ") }
  image { File.open(File.join(images_path, "festival.png")) }
end
