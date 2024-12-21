CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    contact_info TEXT,
    UNIQUE (full_name, birth_date) 
);

CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    contact_info TEXT,
    UNIQUE (full_name, birth_date) 
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    teacher_id INTEGER NOT NULL REFERENCES teachers(teacher_id) ON DELETE 
CASCADE,
    UNIQUE (course_name, teacher_id)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id) ON DELETE 
CASCADE,
    course_id INTEGER NOT NULL REFERENCES courses(course_id) ON DELETE 
CASCADE, 
    UNIQUE (student_id, course_id)
);

CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    enrollment_id INTEGER NOT NULL REFERENCES enrollments(enrollment_id) 
ON DELETE CASCADE,
    grade INTEGER CHECK (grade BETWEEN 1 AND 5), 
    grade_date DATE NOT NULL DEFAULT CURRENT_DATE,
    UNIQUE (enrollment_id, grade_date)
);
