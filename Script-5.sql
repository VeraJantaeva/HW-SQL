 
-- создаем таблицу с жанрами
CREATE table if not exists style (
	id_style serial PRIMARY KEY,
	name_style TEXT NOT null
	);

-- создаем таблицу с исполнителями
CREATE TABLE IF NOT EXISTS singer (
	id_singer serial PRIMARY KEY,
	name_singer TEXT NOT null,
	name_style text not null,
	name_album text
	);

-- создаем таблицу с треками
CREATE TABLE IF NOT EXISTS track (
	id_track serial PRIMARY KEY,
	name_album text NOT NULL,
	time text not null
	);

-- создаем таблицу с альбомами
CREATE TABLE IF NOT EXISTS album (
	id_album serial PRIMARY KEY,
	name_album TEXT NOT NULL,
	date_create DATE NOT NULL,
	singer TEXT NOT null
	);

-- создаем таблицу со сборниками
CREATE TABLE IF NOT EXISTS collection (
	id_collection serial PRIMARY KEY,
	name_collection text not null,
	date_creation date not null,
	name_track text not null
	);


-- связь между жанром и исполнителем
CREATE TABLE IF NOT EXISTS style_singer (
	id serial PRIMARY KEY,
	id_style TEXT NOT NULL REFERENCES style (id_style),
	id_singer text not null references singer (id_singer));

-- связь между исполнителямии жанрами и альбомами
CREATE TABLE IF NOT EXISTS singer_style_album (
	id serial PRIMARY KEY,
	id_singer TEXT  REFERENCES singer(id_style),
	id_style TEXT  REFERENCES style(id_style),
	id_album TEXT REFERENCES album(id_album));

-- связь между треками и альбомами
CREATE TABLE IF NOT EXISTS track_album (
	id serial PRIMARY KEY,
	id_album text NOT NULL REFERENCES album(id_album),
	id_track text NOT NULL REFERENCES track(id_track));

-- связь между альбомами и исполнителями
CREATE TABLE IF NOT EXISTS album_singer (
	id serial PRIMARY KEY,
	id_album TEXT NOT NULL REFERENCES singer (id_album),
	id_singer TEXT NOT null references singer(id_singer));

--связь песни и сборника
CREATE TABLE IF NOT EXISTS collection_track (
	id serial PRIMARY KEY,
	id_collection NOT null references collection(id_collection),
	id_track text not null references track(id_track));
