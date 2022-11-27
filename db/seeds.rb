# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'charutheater',
)

[
  ['test1@test.com', '山田太郎', 'ヤマダタロウ', '111111', profile_image: File.open('./app/assets/images/man.1.png') ],
  ['test2@test.com', '山田花子', 'ヤマダハナコ', '111111',profile_image: File.open('./app/assets/images/woman.png') ],
  ['test3@test.com', '田中太郎', 'タナカタロウ', '111111',profile_image: File.open('./app/assets/images/man.2.png') ],
  ['test4@test.com', '青森太郎', 'アオモリタロウ', '111111',profile_image: File.open('./app/assets/images/man.3.png') ],
  ['test5@test.com', '山梨鉄平', 'ヤマナシテッペイ', '111111',profile_image: File.open('./app/assets/images/man.4.png') ],
  ['test6@test.com', '田中花子', 'タナカハナコ', '111111',profile_image: File.open('./app/assets/images/woman.png') ]
  
].each do |email, name,  kana_name, encrypted_password, profile_image|
  User.create!(
    { email: email, name: name, kana_name: kana_name, encrypted_password: password, profile_image: profile_image }
  )
  end 
  
# [
#  ['', '山田太郎',  '111111' ],
#  ['test2@test.com', '山田花子', 'ヤマダハナコ', '111111',profile_image: File.open('./app/assets/images/woman.png') ],
#  ['test3@test.com', '田中太郎', 'タナカタロウ', '111111',profile_image: File.open('./app/assets/images/man.2.png') ],
#  ['test4@test.com', '青森太郎', 'アオモリタロウ', '111111',profile_image: File.open('./app/assets/images/man.3.png') ],
#  ['test5@test.com', '山梨鉄平', 'ヤマナシテッペイ', '111111',profile_image: File.open('./app/assets/images/man.4.png') ],
#  ['test6@test.com', '田中花子', 'タナカハナコ', '111111',profile_image: File.open('./app/assets/images/woman.png') ]
  
# ].each do |title, introduction, genre_id|
#  Theater.create!(
#     { title: title, introduction: introduction, genre_id: genre_id }
#  )
#  end 
  
