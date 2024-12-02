CREATE TABLE "department" (
    "department_no" VARCHAR(255)   NOT NULL,
    "department_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "department_no"
     )
);

CREATE TABLE "department_emp" (
    "employee_no" INT   NOT NULL,
    "department_no" VARCHAR(255)   NOT NULL
);

CREATE TABLE "department_manager" (
    "department_no" VARCHAR(255)   NOT NULL,
    "employee_no" INT   NOT NULL
);

CREATE TABLE "employees" (
    "employee_no" INT   NOT NULL,
    "employee_title" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(255)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "salaries" (
    "employee_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "employee_title" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "employee_title"
     )
);

ALTER TABLE "department_emp" ADD CONSTRAINT "fk_department_emp_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "department_emp" ADD CONSTRAINT "fk_department_emp_department_no" FOREIGN KEY("department_no")
REFERENCES "department" ("department_no");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_department_no" FOREIGN KEY("department_no")
REFERENCES "department" ("department_no");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employee_title" FOREIGN KEY("employee_title")
REFERENCES "titles" ("employee_title");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");