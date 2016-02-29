require 'factory_girl_rails'
require 'rspec/mocks/standalone'

puts 'Create admin'

admin = FactoryGirl.create(:user,
  email: 'admin@diary.com',
  password: '1234567890',
  admin: true,
  confirmed_at: DateTime.now,
  username: 'Mariusz'
)

puts 'Create users'

4.times do
  FactoryGirl.create(:user)
end

puts 'Create fishes'

10.times do
  FactoryGirl.create(:fish)
end

puts 'Create methods'

10.times do
  FactoryGirl.create(:catch_method, fishing_type: FishingType.all.sample.to_s)
end

puts 'Create places'

place_1 = Place.create(name: 'Zegrze',
  notes: 'super łowisko',
  lat: 52.53011607781287,
  lng: 20.64605712890625,
  user: User.first,
  place_type: 'pzw'
)

place_2 = Place.create(name: 'Moje prywatne łowisko',
  notes: 'super łowisko',
  lat: 52.00011607781287,
  lng: 20.44605712890625,
  user: User.first,
  place_type: 'pzw',
  private: true
)

place_3 = Place.create(name: 'Szczęsne',
  notes: 'łowisko karpiowe',
  lat: 52.13011607781287,
  lng: 20.64605712890625,
  user: User.last,
  place_type: 'commercialism'
)

place_4 = Place.create(name: 'Ossów',
  notes: 'łowisko specjalne',
  lat: 51.66011607781287,
  lng: 20.24605712890625,
  user: User.all.sample,
  place_type: 'commercialism'
)

puts 'Create expeditions for admin'

expedition1 = Expedition.create(
  start_at: "2016-02-23 19:59:00",
  end_at: "2016-02-23 19:59:00",
  place: place_1,
  user: admin
)

5.times do
  form = double(
    valid?: true,
    count: rand(2..100),
    fish_id: Fish.all.sample.id,
    expedition_id: expedition1.id,
    length: '42-50',
    weight: '1.6-2',
    notes: 'super rybki',
    user_id: admin.id,
    image: nil,
    method_id: CatchMethod.all.sample.id
  )

  CreateExpeditionFishService.new(expedition1, form).call
end

form = double(
  valid?: true,
  count: rand(2..100),
  fish_id: Fish.all.sample.id,
  expedition_id: expedition1.id,
  length: '42-50',
  weight: '1.6-2',
  notes: 'super rybki',
  user_id: admin.id,
  image: nil,
  method_id: CatchMethod.all.sample.id
)


expedition2 = Expedition.create(
  start_at: "2016-02-13 12:59:00",
  end_at: "2016-02-113 19:59:00",
  place: place_2,
  user: admin
)
CreateExpeditionFishService.new(expedition2, form).call

puts 'Create expeditions for other users'

5.times do
  user = User.all.sample
  expedition1 = Expedition.create(
    start_at: "2016-02-22 10:00:00",
    end_at: "2016-02-22 17:00:00",
    place: [place_1, place_3, place_4].sample,
    user: user
  )

  rand(1..5).times do
    form = double(
      valid?: true,
      count: rand(2..100),
      fish_id: Fish.all.sample.id,
      expedition_id: expedition1.id,
      length: '30-40',
      weight: '0.8-1.5',
      notes: 'moje rybki',
      user_id: user.id,
      image: nil,
      method_id: CatchMethod.all.sample.id
    )

    CreateExpeditionFishService.new(expedition1, form).call
  end
end
