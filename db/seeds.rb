team1 = Team.create(name: "Team 1")
team2 = Team.create(name: "Team 2")

forward = Role.create(name: "forward")
goalkeeper = Role.create(name: "goalkeeper")
defender = Role.create(name: "defender")

player1 = Player.create(name: "Player 1", team: team1, role: forward)
player2 = Player.create(name: "Player 2", team: team1, role: goalkeeper)
player3 = Player.create(name: "Player 3", team: team2, role: defender)

match1 = Match.create(date: Date.new(2024, 1, 1), weight: 1.5)
match2 = Match.create(date: Date.new(2024, 2, 1), weight: 2.0)

Statistic.create(player: player1, match: match1, goals: 2, assists: 1, shots: 5, saves: 0, tackles: 0)
Statistic.create(player: player2, match: match1, goals: 0, assists: 0, shots: 0, saves: 8, tackles: 2)
Statistic.create(player: player3, match: match2, goals: 0, assists: 0, shots: 1, saves: 0, tackles: 5)
