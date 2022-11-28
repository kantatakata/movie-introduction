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
  ['test1@test.com', '山田太郎', 'ヤマダタロウ', '宜しくです。', '111111', './app/assets/images/man1.png', 'man1.png'],
  ['test2@test.com', '山田花子', 'ヤマダハナコ', 'たくさん投稿していきます。',  '111111', './app/assets/images/woman.png', 'woman.png' ],
  ['test3@test.com', '田中太郎', 'タナカタロウ', 'はじめまして！', '111111', './app/assets/images/man2.png', 'man2.png' ],
  ['test4@test.com', '青森太郎', 'アオモリタロウ', '映画関係の仕事をしています。', '111111', './app/assets/images/man3.png','man3.png' ],
  ['test5@test.com', '山梨鉄平', 'ヤマナシテッペイ', '宜しくお願い致します。', '111111', './app/assets/images/man4.png','man4.png' ],
  ['test6@test.com', '田中花子', 'タナカハナコ', 'みなさんの投稿を楽しみにしています。', '111111', './app/assets/images/woman.png','woman.png' ]
].each do |email, name,  kana_name, introduction, password, profile_image, filename|
  User.create!(
    { email: email, name: name, kana_name: kana_name, introduction: introduction, password: password, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(profile_image), filename: filename)}
  )
end

 Genre.create!(
   [
     {
       name: 'アクション',
     },
     {
       name: 'コメディ',
     },
     {
       name: 'ロマンス',
     },
     {
       name: 'アニメ',
     },
     {
       name: 'SF',
     },
     {
       name: 'サスペンス',
     },
     {
       name: '戦争',
     },
     {
       name: 'ホラー',
     },
     {
       name: '歴史',
     },
     {
       name: 'ミステリー',
     },
     {
       name: 'ファンタジー',
     },
     {
       name: 'アドベンチャー',
     },
     {
       name: 'スポーツ',
     },
     {
       name: 'ミュージカル',
     },
     {
       name: 'ドラマ',
     },
     {
       name: '青春',
     },
     {
       name: '恋愛',
     },
     {
       name: 'ドキュメンタリー'
     }
   ]
 )




[
 ['ハリーポッターと賢者の石', '第一シリーズ',  '11', '2' ],
 ['ハリー・ポッターと秘密の部屋', '第二シリーズ', '11', '1' ],
 ['ズートピア', '口がうまい詐欺師のキツネと新米警官のウサギが手を組み、事件の解決に挑む', '4', '3' ],
 ['シュガー・ラッシュ', 'ラルフは自分が心優しきヒーローだとみんなに認めてもらうため、冒険に飛び出す', '4', '2' ],
 ['ベイマックス', '天才少年とロボットが街を救うために力を合わせる', '4', '3' ],
 ['ジョニー・イングリッシュ 気休めの報酬', 'ローワン・アトキンソン主演のスパイ映画', '2', '1' ],
 ['アバター', '1人の男が冒険に乗り出す。彼はその魅惑的な世界を故郷と呼び、そこを守るために戦うことを決意する', '5', '4' ],
 ['アベンジャーズ', 'ニック・フューリーは、迫りくる悪と戦うためにヒーローを集めチームを結成する', '11', '4' ],
 ['シビル・ウォー', 'キャプテン・アメリカとアイアンマンが対立し、アベンジャーズは分裂してしまう', '11', '4' ],
 ['ブラックパンサー', '故国ワカンダが脅威にさらされテイ・チャラは恐るべき敵と対峙する', '11', '2' ],
 ['シャーロック・ホームズ　シャドウゲーム', '史上最強の名コンビの前に現れた“もう一人の天才”とは！？ヨーロッパに危機勃発！', '10', '1' ],
 ['ハクソー・リッジ', '第二次世界大戦の沖縄戦で衛生兵として従軍したデズモンド・T・ドスの実体験を描いた戦争映画。', '7', '3' ],
 ['ザ・マジックアワー', 'ボスの愛人に手を出してしまった手下は、命の代償に伝説の殺し屋を探し出すハメに。無名の三流役者を雇い、殺し屋に仕立てあげるという苦肉の策を思いつくが……。', '2', '3' ],
 ['ベッカムと弱小キッズチーム', 'デヴィッド・ベッカムは彼が少年時代に所属したリーグでプレーしているチームを助けるため、故郷に戻る', '18', '1' ]


].each do |title, introduction, genre_id, user_id|
 Theater.create!(
    { title: title, introduction: introduction, genre_id: genre_id, user_id: user_id}
 )
end

