# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Type.create(title:"食料品")
Type.create(title:"外食")
Type.create(title:"生活消耗品")
Type.create(title:"電気代")
Type.create(title:"ガス代")
Type.create(title:"水道代")
Type.create(title:"服・靴")
Type.create(title:"美容")
Type.create(title:"家具・収納・家電")
Type.create(title:"車関連")
Type.create(title:"高速・駐車代")
Type.create(title:"ガソリン")
Type.create(title:"保険")
Type.create(title:"遊び")
Type.create(title:"本・DVD")
Type.create(title:"交際・接待")
Type.create(title:"子供(出産)")
Type.create(title:"医療費")
Type.create(title:"携帯・ネット")
Type.create(title:"役所・税金・奨学金")
Type.create(title:"その他")

# Receipt.create(payment:520,p_date:"2018-03-04",type_id:1,user_id:2)
# Receipt.create(payment:1500,p_date:"2018-03-02",type_id:2,user_id:2)
# Receipt.create(payment:2800,p_date:"2018-03-04",type_id:1,user_id:2)
# Receipt.create(payment:3200,p_date:"2018-03-02",type_id:2,user_id:1)
# Receipt.create(payment:340,p_date:"2018-03-03",type_id:3,user_id:1)
# Receipt.create(payment:420,p_date:"2018-03-03",type_id:3,user_id:2)
# Receipt.create(payment:960,p_date:"2018-03-03",type_id:1,user_id:2)
# Receipt.create(payment:2000,p_date:"2018-03-03",type_id:2,user_id:2)

# User.create!(name:"Example User",
#              email:"example@rails.org",
#              password:"foobar",
#              password_confirmation:"foobar",
#              admin:true)

# 99.times do |n|
#     name=Faker::Name.name
#     email="Example-#{n}@sample.com"
#     password="password"
#     User.create!(name:name,email:email,password:password,password_confirmation:password)
# end