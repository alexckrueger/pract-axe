User.create!([
  {email: "alex@test.com", password: "password", name: "Alex"},
  {email: "mikey@test.com", password: "password", name: "Mikey"}
])

Training.create!([
  {user_id: 1, name: "Alex no clutch"},
  {user_id: 1, name: "Alex clutch only"},
  {user_id: 1, name: "Alex Big Axe"},
  {user_id: 2, name: "Mikey no clutch"},
  {user_id: 2, name: "Mikey clutch only"},
  {user_id: 2, name: "Mikey Big Axe"}
])

Throw.create!([
  {training_id: 1, points: 5},
  {training_id: 1, points: 5},
  {training_id: 1, points: 5},
  {training_id: 1, points: 3},
  {training_id: 1, points: 1},
  {training_id: 1, points: 3},
  {training_id: 1, points: 5},
  {training_id: 1, points: 5},
  {training_id: 1, points: 3}
])

Throw.create!([
  {training_id: 2, points: 0, clutch_called: true},
  {training_id: 2, points: 0, clutch_called: true},
  {training_id: 2, points: 7, clutch_called: true},
  {training_id: 2, points: 7, clutch_called: true},
  {training_id: 2, points: 7, clutch_called: true},
  {training_id: 2, points: 7, clutch_called: true},
  {training_id: 2, points: 7, clutch_called: true},
  {training_id: 2, points: 0, clutch_called: true},
  {training_id: 2, points: 7, clutch_called: true},
  {training_id: 2, points: 7, clutch_called: true},
  {training_id: 2, points: 7, clutch_called: true},
  {training_id: 2, points: 0, clutch_called: true}
])

Throw.create!([
  {training_id: 3, points: 0, big_axe: true},
  {training_id: 3, points: 3, big_axe: true},
  {training_id: 3, points: 5, big_axe: true},
  {training_id: 3, points: 5, big_axe: true},
  {training_id: 3, points: 3, big_axe: true},
  {training_id: 3, points: 3, big_axe: true},
  {training_id: 3, points: 1, big_axe: true},
  {training_id: 3, points: 3, big_axe: true},
  {training_id: 3, points: 5, big_axe: true},
  {training_id: 3, points: 7, big_axe: true, clutch_called: true},
  {training_id: 3, points: 7, big_axe: true, clutch_called: true},
  {training_id: 3, points: 0, big_axe: true, clutch_called: true}
])

Throw.create!([
  {training_id: 4, points: 5},
  {training_id: 5, points: 7, clutch_called: true},
  {training_id: 6, points: 5, big_axe: true}
])