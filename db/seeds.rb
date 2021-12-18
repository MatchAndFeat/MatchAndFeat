User.destroy_all
Project.destroy_all
Feat.destroy_all
Skill.destroy_all

20.times do
  Skill.create(
    name: Faker::Job.key_skill,
    )
end

puts "#{Skill.count} skills have been created."

5.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    social_link: Faker::Internet.url
  )
  rand(0..4).times do
    user.skills << Skill.all.sample
  end
  rand_filename = "#{rand(1..6)}.png"
  user.avatar.attach(io: File.open(File.join(Rails.root,"db/seeds_assets/avatars/#{rand_filename}")), filename: rand_filename)
end

puts "#{User.count} users have been created."

5.times do
  project = Project.create(
    title: Faker::Artist.name, 
    description:Faker::Lorem.paragraph(sentence_count: 10, supplemental: true, random_sentences_to_add: 50), 
    user: User.all.sample
  )
  rand(1..4).times do
    project.skills << Skill.all.sample
  end
  rand_filename = "#{rand(1..16)}.png"
  project.picture.attach(io: File.open(File.join(Rails.root,"db/seeds_assets/projects/#{rand_filename}")), filename: rand_filename)
  rand(1..6).times do
    rand_filename = "#{rand(1..16)}.png"
    project.attachments.attach(io: File.open(File.join(Rails.root,"db/seeds_assets/projects/#{rand_filename}")), filename: rand_filename)
  end
end

puts "#{Project.count} projects have been created."

10.times do
  feat = Feat.create(
    title: Faker::Company.name,
    description: Faker::Lorem.paragraph,
    project: Project.all.sample, 
    user: User.all.sample
    )
  rand(1..6).times do
    rand_filename = "#{rand(1..16)}.png"
    feat.attachments.attach(io: File.open(File.join(Rails.root,"db/seeds_assets/projects/#{rand_filename}")), filename: rand_filename)
  end
end

puts "#{Feat.count} feats have been created."

30.times do
  Like.create(
    user: User.all.sample,
    likeable: Project.all.sample
  )
  Like.create(
    user: User.all.sample,
    likeable: Feat.all.sample
  )
end

puts "#{Like.count} likes have been created"