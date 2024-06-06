-- postgresデータベースに接続
\c postgres
-- 既存のデータベースを破棄
DROP DATABASE IF EXISTS reservationdb;
-- 既存のユーザを破棄
DROP ROLE IF EXISTS reservationuser;
CREATE ROLE reservationuser WITH PASSWORD 'himitu' LOGIN;
CREATE DATABASE reservationdb OWNER reservationuser ENCODING 'UTF8';