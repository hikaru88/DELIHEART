Admin.create!(
  email: 'admin@admin.com',
  password: 'aaaaaa'
)

5.times do |n|
  User.create!(
    email: "user#{n + 1}@com",
    name: "ユーザー#{n + 1}",
    password: 'aaaaaa'
  )
end

10.times do |n|
  Surprise.create!(
    user_id: "#{rand(1..5)}".to_i,
    name: "サプライズ#{n + 1}",
    description: "サンプルサプライズです。",
    price: n * 1000,
    year: 2020,
    month: 12,
    day: 31
  )
end

10.times do |n|
  TargetArea.create!(
    surprise_id: n + 1,
    name: rand(0..9)
  )
end