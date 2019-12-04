# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MessageTemplate.create([
    { name: 'Hello', body: "Hello,<br/>Thank you for your call today.<br/>Please contact us if you have any further questions." },
    { name: 'Missed Call', body: 'Hello,<br/>Unfortunately we were unable to reach you today.<br/>Please give us a call back at your earliest convenience.' },
    { name: 'Test', body: 'This is a test message.' }])