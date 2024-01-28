-- (SQL): ОТНОШЕНИЯ:
/*
  @OneToOne:   One user has only one spouce                 : a prolonged row
  @OneToMany:  One user can have many social accounts       : list
  @ManyToOne:  Many social account can belong to one user   : a row / aggregate
  @ManyToMany: Many friends can have many friends           : list

  @OneToOne: table:
  id         user_id        first_name    last_name  email        password
  1          100            dv            kkk        kk@mail.ru   1234567

  по сути именно такая таблица и создается через join
  из нескольких таблиц:

  @OneToMany: table:        <- связь здесь
  id          address_id    user_id       country    city
  1           123           1             Russia     Moscow
  2           234           1             Canada     Vancouver
*/