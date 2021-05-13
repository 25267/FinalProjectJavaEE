
CREATE TABLE  users (
                               id  BIGINT GENERATED ALWAYS AS IDENTITY,
                               name varchar(255),
                               password varchar(255),
                               PRIMARY KEY(id)
)