# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Project.destroy_all
Feat.destroy_all
Tag.destroy_all

1.times do
    User.create!(
        user_name: Faker::Name.first_name,   
        email: Faker::Internet.email,
        password: Faker::Internet.password   
    )
end

1.times do
    Project.create!(
        title: Faker::Artist.name, 
        description:Faker::Lorem.paragraph(sentence_count: 10, supplemental: true, random_sentences_to_add: 50), 
        user: User.all.sample
    )
end

2.times do
    Feat.create!(
        title: Faker::Company.name, 
        project: Project.all.sample, 
        user: User.all.sample
    )
end

10.times do
    Tag.create!(
        name: Faker::Job.key_skill,
        project: Project.all.sample
    )
end

tags_array = Tag.all

Project.all.each do |each_project|
    random_tag_number = rand(1..5)
    random_tag_number.times do
        JoinTableTagsProject.create(
            project: each_project,
            tag: tags_array[rand(0...tags_array.length)]
        )
    end
end
