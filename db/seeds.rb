if Conversation.count == 0
  conversations = Conversation.create([
    {content: "Japanese/Mandarin Language Exchange in Culver City", time: '2016-04-12'},
    {content: "English/Spanish Language Exchange in Danville", time: '2016-04-12'}
  ])
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
