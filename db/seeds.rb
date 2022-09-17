# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {email: 'minoru@com', name: 'Minoru', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'takashi@com', name: 'Takashi', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lui@com', name: 'Lui', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'kaoru@com', name: 'Kaoru', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'fishingbear@com', name: 'FishingBear', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'yeti@com', name: 'Yeti', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {email: 'rie@com', name: 'Rie', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    {email: 'monaka@com', name: 'Monaka', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")},
    {email: 'penpen@com', name: 'PENPEN', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")},
    {email: 'maya@com', name: 'Maya', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")},
    {email: 'sachi@com', name: 'Sachi', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")},
    {email: 'tamachan@com', name: 'Tamachan', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename:"sample-user12.jpg")},
    {email: 'panda@com', name: 'Panda', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename:"sample-user13.jpg")},
    {email: 'rabbit@com', name: 'Rabbit', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.jpg"), filename:"sample-user14.jpg")},
    {email: 'toshimichi@com', name: 'Toshimichi', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename:"sample-user15.jpg")},
    {email: 'superusa@com', name: 'SuperUsa', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user16.jpg"), filename:"sample-user16.jpg")},
    {email: 'hana@com', name: 'Hana', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user17.jpg"), filename:"sample-user17.jpg")},
    {email: 'keiji@com', name: 'Keiji', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user18.jpg"), filename:"sample-user18.jpg")},
    {email: 'taco@com', name: 'Taco', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user19.jpg"), filename:"sample-user19.jpg")},
    {email: 'bug@com', name: 'BUG', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user20.jpg"), filename:"sample-user20.jpg")},
    {email: 'takeru@com', name: 'Takeru', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user21.jpg"), filename:"sample-user21.jpg")},
    {email: 'popman@com', name: 'Popman', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user22.jpg"), filename:"sample-user22.jpg")},
    {email: 'rin@com', name: 'Rin', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user23.jpg"), filename:"sample-user23.jpg")},
    {email: 'tora@com', name: 'Tora', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user24.jpg"), filename:"sample-user24.jpg")},
    {email: 'mitsu@com', name: 'Mitsu', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user25.jpg"), filename:"sample-user25.jpg")},
    {email: 'shohei@com', name: 'Shohei', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user26.jpg"), filename:"sample-user26.jpg")},
    {email: 'nagisa@com', name: 'Nagisa', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user27.jpg"), filename:"sample-user27.jpg")},
    {email: 'ojaru@com', name: 'Ojaru', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user28.jpg"), filename:"sample-user28.jpg")},
    {email: 'tanaka@com', name: 'Tanaka', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user29.jpg"), filename:"sample-user29.jpg")},
    {email: 'ayane@com', name: 'Ayane', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user30.jpg"), filename:"sample-user30.jpg")}
  ]
)

Post.create!(
  [
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: '空から見る空', user_id: users[0].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: '夜明け', user_id: users[1].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: 'ミラーが綺麗だったよ', user_id: users[2].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"), caption: '夏が来たって感じ', user_id: users[3].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"), caption: 'いい天気、ピンクのルアーが可愛い', user_id: users[4].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg"), caption: '雪山の空', user_id: users[5].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg"), caption: '富山に行ってきたよ', user_id: users[6].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg"), caption: '朝日、素敵な一日になりますように', user_id: users[7].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg"), caption: '水がめちゃくちゃ綺麗！', user_id: users[8].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post10.jpg"), filename:"sample-post10.jpg"), caption: '水遊びしたよ', user_id: users[9].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post11.jpg"), filename:"sample-post11.jpg"), caption: 'プール日和', user_id: users[10].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post12.jpg"), filename:"sample-post12.jpg"), caption: 'ポニーいた！！', user_id: users[11].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post13.jpg"), filename:"sample-post13.jpg"), caption: '桜が綺麗でした', user_id: users[12].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post14.jpg"), filename:"sample-post14.jpg"), caption: '海辺のランチ', user_id: users[13].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post15.jpg"), filename:"sample-post15.jpg"), caption: '釣りは癒される', user_id: users[14].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post16.jpg"), filename:"sample-post16.jpg"), caption: '透明度すごかった', user_id: users[15].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post17.jpg"), filename:"sample-post17.jpg"), caption: '夏の空が大好き', user_id: users[16].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post18.jpg"), filename:"sample-post18.jpg"), caption: 'ガス抜けてピーカン', user_id: users[17].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post19.jpg"), filename:"sample-post19.jpg"), caption: '夕方少しだけ海辺の散歩', user_id: users[18].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post20.jpg"), filename:"sample-post20.jpg"), caption: '空の境目が、、、', user_id: users[19].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post21.jpg"), filename:"sample-post21.jpg"), caption: '今日は釣れますように', user_id: users[20].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post22.jpg"), filename:"sample-post22.jpg"), caption: '虹！いい事ありそう', user_id: users[21].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post23.jpg"), filename:"sample-post23.jpg"), caption: '池に空が映ってて綺麗だったよ', user_id: users[22].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post24.jpg"), filename:"sample-post24.jpg"), caption: 'この先にカフェがあるなんて', user_id: users[23].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post25.jpg"), filename:"sample-post25.jpg"), caption: '幸せを感じる瞬間', user_id: users[24].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post26.jpg"), filename:"sample-post26.jpg"), caption: '初日の出！！', user_id: users[25].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post27.jpg"), filename:"sample-post27.jpg"), caption: '冬空サイコー', user_id: users[26].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post28.jpg"), filename:"sample-post28.jpg"), caption: '太陽が眩しい', user_id: users[27].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post29.jpg"), filename:"sample-post29.jpg"), caption: '見事なミラー。景色としては最高', user_id: users[28].id },
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post30.jpg"), filename:"sample-post30.jpg"), caption: '可愛いブランコあったよ〜', user_id: users[29].id }
  ]
)