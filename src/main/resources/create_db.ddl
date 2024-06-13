-- postgresデータベースに接続
\c postgres
-- 既存のデータベースを破棄
DROP DATABASE IF EXISTS db_reservation;
-- 既存のユーザを破棄
DROP ROLE IF EXISTS usr_reservation;
CREATE ROLE usr_reservation WITH PASSWORD 'himitu' LOGIN;
CREATE DATABASE db_reservation OWNER usr_reservation ENCODING 'UTF8';