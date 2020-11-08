CREATE TABLE users(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE roles(
  role VARCHAR PRIMARY KEY
);

CREATE TABLE user_roles(
  user_id INT NOT NULL,
  role VARCHAR NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (role) REFERENCES roles(role)
);

CREATE TABLE job_queue(
  id INT AUTO_INCREMENT PRIMARY KEY,
  creation_date TIMESTAMP NOT NULL,
  user_id INT,
  completed BOOLEAN DEFAULT false,
  FOREIGN KEY (user_id) REFERENCES users(id)
);