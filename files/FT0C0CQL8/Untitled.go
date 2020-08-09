// Function Option Pattern を使ったちょっと可変な repository のメソッド

// List retrieves list of Section with given filters.
func (r *Repository) List(ctx context.Context, f ...rfilter.Filter) ([]*vfdo.Section, error) {
	s, err := orm.XORMSession(ctx)
	if err != nil {
		return nil, err
	}
	s = rfilter.Filters.ApplyXorm(f, s)
	var list []*vfdo.Section
	err = s.Find(&list)
	if err != nil {
		return nil, err
	}
	return list, err
}

---

// rfilter.Filter の定義

// Filter applies a filter to repository
type Filter interface {
	// ApplyXorm applies a filter for xorm.Session
	ApplyXorm(*xorm.Session) *xorm.Session
}

---

// 使ってるところ

list, err := srv.repos.List(ctx, cf, p.sortFilter(), p.limitFilter())