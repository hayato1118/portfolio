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

Admin.create!(email: 'admin@gmail.com', password: '123456')



30.times do |i|
gimei = Gimei.name
address = Gimei.address
	User.create(:email => "sample#{1+i}@yahoo.co.jp",
				:password => "123456",
				:nickname => gimei.last.romaji ,
				:last_name => gimei.last.kanji ,
				:last_name_kana => gimei.last.hiragana ,
				:first_name => gimei.first.kanji ,
				:first_name_kana => gimei.first.hiragana ,
				:introduction => "よろしくお願いします。" ,
				:state => address.prefecture.kanji ,
				:city => address.city.kanji ,
				:street => address.town.kanji ,
				:zip => "1111111" ,
				:phone_number1 => "090" ,
				:phone_number2 => "1234" ,
				:phone_number3 => "1234" ,
				:twitter_id => "" ,
				:facebook_id => "" ,
				:instagram_id => "" ,
				:financial_institution_name => "CODE銀行" ,
				:branch_name => "Rails支店" ,
				:account_number => "123456" ,
				:account_holder_name => gimei.katakana ,
				)
	 Cart.create(:user_id => "#{1+i}")
end






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








