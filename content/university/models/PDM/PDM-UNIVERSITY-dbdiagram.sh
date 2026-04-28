#!/bin/bash

# ==========================================
# Archivo: universidad_dbdiagram.sh
# Descripción: Script DBML para dbdiagram.io
# ==========================================

cat << 'EOF' > universidad.dbml
// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table Faculties {
  id int [pk]
  name varchar
}

Table Careers {
  id int [pk]
  name varchar
  id_faculty int
}

Table Courses {
  id int [pk]
  name varchar
  id_faculty int
}

Table Schedules {
  id int [pk]
  day varchar
  start_time varchar
  end_time varchar
}

Table Buildings {
  id int [pk]
  name varchar
}

Table Classrooms {
  id int [pk]
  name varchar
  id_building int
}

Table Course_Schedule {
  id int [pk]
  id_course int
  id_schedule int
  id_classroom int
  id_professor int
  capacity int
}

Table Courses_Careers {
  id_course int
  id_career int
  curriculum_semester int
}

Table Roles {
  id int [pk]
  name varchar
}

Table Users {
  id int [pk]
  name varchar
  last_name varchar
  id_role int
}

Table Careers_Students {
  id_career int
  id_user int
  current_semester int
}

Table Courses_Students {
  id_course_schedule int
  id_user int
}

Ref: Careers.id_faculty > Faculties.id
Ref: Courses.id_faculty > Faculties.id
Ref: Classrooms.id_building > Buildings.id
Ref: Course_Schedule.id_course > Courses.id
Ref: Course_Schedule.id_schedule > Schedules.id
Ref: Course_Schedule.id_classroom > Classrooms.id
Ref: Course_Schedule.id_professor > Users.id
Ref: Courses_Careers.id_course > Courses.id
Ref: Courses_Careers.id_career > Careers.id
Ref: Users.id_role > Roles.id
Ref: Careers_Students.id_career > Careers.id
Ref: Careers_Students.id_user > Users.id
Ref: Courses_Students.id_course_schedule > Course_Schedule.id
Ref: Courses_Students.id_user > Users.id
EOF

echo "Archivo universidad.dbml creado correctamente."
