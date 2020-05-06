Admin.create!(
  email: 'admin@admin.com',
  password: 'aaaaaa'
)

5.times do |n|
  User.create!(
    email: "user#{n + 1}@com",
    name: "ユーザー#{n + 1}",
    phone_number: "00012345678",
    password: 'aaaaaa'
  )
end

10.times do |n|
  Surprise.create!(
    user_id: "#{rand(1..5)}".to_i,
    name: "サプライズ#{n + 1}",
    description: "サンプルサプライズです。",
    price: n * 1000,
    postage: 0
  )
end

10.times do |n|
  TargetArea.create!(
    surprise_id: n + 1,
    name: rand(0..9)
  )
end

5.times do |n|
  Address.create!(
    user_id: n + 1,
    receiver: "田中太郎",
    postal_code: "3330000",
    prefecture: n,
    city: "青木町",
    after: "1-10-10 ライオンズマンション602",
    is_default: true
  )
end