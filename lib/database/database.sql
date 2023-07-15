CREATE TABLE users (
	id SMALLSERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL
);

CREATE TABLE plates (
  id SMALLSERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
  price INT NOT NULL,
  suggested_for INT DEFAULT 1,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);











