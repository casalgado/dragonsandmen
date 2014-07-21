user = User.create!(email: "beto@beto.com", password: "beto", password_confirmation: "beto");
(1..5).each do |index|
	user.men.create!(name: "Beto Man #{index}")
	user.dragons.create!(name: "Beto Dragon #{index}")
end
(1..10).each do |index|
	user = User.create!(email: "Comp#{index}@email.com", password: "beto", password_confirmation: "beto");
	(1..5).each do |player_index|
		user.men.create(    name: "Man #{index}#{player_index}")
		user.dragons.create(name: "Dragon #{index}#{player_index}")
	end
end