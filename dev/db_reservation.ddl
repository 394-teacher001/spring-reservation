DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS size;

/**********************************/
/* テーブル名: 広さ */
/**********************************/
CREATE TABLE size(
		code SERIAL,
		name VARCHAR(10) NOT NULL
);

/**********************************/
/* テーブル名: 部屋 */
/**********************************/
CREATE TABLE rooms(
		id          SERIAL,
		room_number INTEGER NOT NULL,
		size        INTEGER NOT NULL,
		price       INTEGER NOT NULL,
		description TEXT
);

/**********************************/
/* テーブル名: 利用者 */
/**********************************/
CREATE TABLE users(
		id          SERIAL,
		name        VARCHAR(10)   NOT NULL,
		zipcode     CHARACTER(8),
		address     VARCHAR(255),
		phone       CHARACTER(18) NOT NULL,
		email       VARCHAR(255)  NOT NULL,
		birthday    DATE,
		signup_on   DATE          NOT NULL DEFAULT current_date,
		canceled_on DATE
);

/**********************************/
/* テーブル名: 予約 */
/**********************************/
CREATE TABLE reservations(
		id          SERIAL,
		user_id     INTEGER NOT NULL,
		room_id     INTEGER NOT NULL,
		quantity    INTEGER NOT NULL DEFAULT 1,
		check_in    DATE    NOT NULL,
		check_out   DATE    NOT NULL,
		reserved_on DATE    NOT NULL DEFAULT current_date,
		canceled_on DATE
);


ALTER TABLE size ADD CONSTRAINT IDX_size_PK PRIMARY KEY (code);

ALTER TABLE rooms ADD CONSTRAINT IDX_rooms_PK PRIMARY KEY (id);
ALTER TABLE rooms ADD CONSTRAINT IDX_rooms_FK FOREIGN KEY (size) REFERENCES size (code);

ALTER TABLE users ADD CONSTRAINT IDX_users_PK PRIMARY KEY (id);

ALTER TABLE reservations ADD CONSTRAINT IDX_reservations_PK PRIMARY KEY (id);
ALTER TABLE reservations ADD CONSTRAINT IDX_reservations_room_FK FOREIGN KEY (room_id) REFERENCES rooms (id);
ALTER TABLE reservations ADD CONSTRAINT IDX_reservations_user_FK FOREIGN KEY (user_id) REFERENCES users (id);

