# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'test@test',
    password: '123456',
)

production_processes = %w(フェーズ1 フェーズ2 フェーズ3 フェーズ4)
production_processes.each do |production_process|
    ProductionProcess.find_or_create_by(name: production_process)
end

workers = [
  {email: 'a@a', password: '123456', last_name: '山田', first_name: '太郎'},
  {email: 'b@b', password: '123456', last_name: '山元', first_name: '太郎'},
  {email: 'c@c', password: '123456', last_name: '山下', first_name: '太郎'},
  {email: 'd@d', password: '123456', last_name: '山本', first_name: '太郎'},
  {email: 'e@e', password: '123456', last_name: '山森', first_name: '太郎'},
]

workers.each do |worker|
  
  worker_data = Worker.find_by(email: worker[:email])
  
  if worker_data.nil?
    Worker.create(
      email: worker[:email],
      password: worker[:password],
      last_name: worker[:last_name],
      first_name: worker[:first_name]
    )
  end
end