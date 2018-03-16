# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongs
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(category_name: 'Ruby on Rails 4.1')
Category.create(category_name: 'Ruby on Rails 4.2')
Category.create(category_name: 'Ruby on Rails 5.0')
Category.create(category_name: 'Ruby on Rails 5.1')
Category.create(category_name: 'PHP 7.0')
Category.create(category_name: 'PHP 7.1')
Category.create(category_name: 'PHP 7.2')
Category.create(category_name: 'Python 2')
Category.create(category_name: 'Python 3')
Category.create(category_name: 'HTML&CSS')
Category.create(category_name: 'jQuery')
Category.create(category_name: 'Java')
Category.create(category_name: 'JavaScript')



# Admin.seed_once do |s|
#   s.id = 1
#   s.email = "admin@gmail.com"
#   s.password = "123456"
# end


# 30.times do |no|
#  	 User.create(:id => "1+#{no}" ,:email => "hayato@yahoo.co.jp" ,:password => "123456" )
# 	 Cart.create(:id => "1+#{no}",:user_id => "1+#{no}" )
# end
#     # User.create(:id => "10" ,:email => "hayato1@yahoo.co.jp" ,:password => "123456")
#     # User.create(:id => "11" ,:email => "hayato2@yahoo.co.jp" ,:password => "123456")
#     # User.create(:id => "12" ,:email => "hayato3@yahoo.co.jp" ,:password => "123456")
#     # User.create(:id => "13" ,:email => "hayato4@yahoo.co.jp" ,:password => "123456")
#     # User.create(:id => "14" ,:email => "hayato5@yahoo.co.jp" ,:password => "123456")

# 30.times do |no|
# 	Product.create(:id => "1+#{no}" ,:user_id => "" ,:price => "" ,:title => "" ,:url => "" ,:product_detail => "" )
# 	Tag.create(:product_id => "1+#{no}" ,:tag_name => "")
# 	6.times. do |i|
# 	ProductCategory.create(:product_id => "1+#{no}" ,:category_id => "1" )
# end


# User.seed(:id,
#   { :id => 1,
#   	:email => "" ,
#   	:nickname => "" ,
#   	:last_name => "" ,
#   	:last_name_kana => "" ,
#   	:first_name => "" ,
#   	:first_name_kana => "" ,
#   	:profile_image_id => "" ,
#   	:introduction => "" ,
#   	:state => "" ,
#   	:city => "" ,
#   	:street => "" ,
#   	:zip => "" ,
#   	:phone_number1 => "" ,
#   	:phone_number2 => "" ,
#   	:phone_number3 => "" ,
#   	:image_id
#   	:twitter_id => "" ,
#   	:facebook_id => "" ,
#   	:instagram_id => "" ,
#   	:deleted_at => "" ,
#   	:financial_institution_name => "" ,
#   	:branch_name => "" ,
#   	:account_number => "" ,
#   	:account_holder_name => "" ,
#   }, { :id => 2,
#   	:email => "" ,
#   	:nickname => "" ,
#   	:last_name => "" ,
#   	:last_name_kana => "" ,
#   	:first_name => "" ,
#   	:first_name_kana => "" ,
#   	:profile_image_id => "" ,
#   	:introduction => "" ,
#   	:state => "" ,
#   	:city => "" ,
#   	:street => "" ,
#   	:zip => "" ,
#   	:phone_number1 => "" ,
#   	:phone_number2 => "" ,
#   	:phone_number3 => "" ,
#   	:image_id
#   	:twitter_id => "" ,
#   	:facebook_id => "" ,
#   	:instagram_id => "" ,
#   	:deleted_at => "" ,
#   	:financial_institution_name => "" ,
#   	:branch_name => "" ,
#   	:account_number => "" ,
#   	:account_holder_name => "" ,
#   })





# OsVersion.create(version_number: 'XP')
# OsVersion.create(version_number: 'Vista')
# OsVersion.create(version_number: '7')
# OsVersion.create(version_number: '8')
# OsVersion.create(version_number: '8.1')
# OsVersion.create(version_number: '10')

# OsVersion.create(version_number: '10.0')
# OsVersion.create(version_number: '10.1')
# OsVersion.create(version_number: '10.2')
# OsVersion.create(version_number: '10.3')
# OsVersion.create(version_number: '10.4')
# OsVersion.create(version_number: '10.5')
# OsVersion.create(version_number: '10.6')
# OsVersion.create(version_number: '10.7')
# OsVersion.create(version_number: '10.8')
# OsVersion.create(version_number: '10.9')
# OsVersion.create(version_number: '10.10')
# OsVersion.create(version_number: '10.11')
# OsVersion.create(version_number: '10.12')

# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '1')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '2')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '3')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '4')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '5')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '6')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '7')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '8')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '9')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '10')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '11')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '12')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '13')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '14')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '15')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '16')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '17')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '18')
# OperatingsystemVersion.create(operatingsystem_id: '1', os_version_id: '19')

# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '1')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '2')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '3')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '4')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '5')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '6')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '7')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '8')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '9')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '10')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '11')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '12')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '13')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '14')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '15')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '16')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '17')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '18')
# OperatingsystemVersion.create(operatingsystem_id: '2', os_version_id: '19')








