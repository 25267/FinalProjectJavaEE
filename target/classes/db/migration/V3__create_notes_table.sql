

CREATE TABLE Notes(
                      id BIGINT GENERATED ALWAYS AS IDENTITY,
                      title varchar,
                      date varchar,
                      status boolean,
                      user_id BIGINT,
                      PRIMARY KEY (id),
                          CONSTRAINT fk_users
                             FOREIGN KEY (user_id)
                                REFERENCES Users(id)
)