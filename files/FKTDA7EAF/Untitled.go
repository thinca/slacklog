type UserMap map[string]User

func (m UserMap) Merge(users []User) UserMap {
	for _, u := range users {
		m[u.ID] = u
	}
	return m
}

func (m UserMap) Array() []User {
	users := make([]User, 0, len(m))
	for _, u := m {
		users = append(users, u)
	}
	return users
}

m := UserMap{}
m.Merge(oldUsers).Merge(currentUsers)
currentUsers = m.Array()