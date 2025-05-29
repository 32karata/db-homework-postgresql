-- Создание таблицы Genre
CREATE TABLE Genre (
    GenreID SERIAL primary key,
    name VARCHAR(100) not null unique
);

-- Создание таблицы Artist
CREATE TABLE Artist (
    ArtistID SERIAL primary key,
    name VARCHAR(100) not null
);

-- Создание таблицы связи ArtistGenre
CREATE TABLE ArtistGenre (
    ArtistGenreID SERIAL primary key,
    ArtistID INTEGER references Artist(ArtistID),
    GenreID INTEGER references Genre(GenreID),
    unique (ArtistID, GenreID)
);

-- Создание таблицы Album
CREATE TABLE Album (
    AlbumID SERIAL primary key,
    title VARCHAR(100) not null,
    release_year INTEGER
);

-- Создание таблицы связи ArtistAlbum
CREATE TABLE ArtistAlbum (
    ArtistAlbumID SERIAL primary key,
    ArtistID INTEGER references Artist(ArtistID),
    AlbumID INTEGER references Album(AlbumID),
    unique (ArtistID, AlbumID)
);

-- Создание таблицы Track
CREATE TABLE Track (
    TrackID SERIAL primary key,
    title VARCHAR(100) not null,
    duration INTEGER not null,
    AlbumID INTEGER references Album(AlbumID)
);

-- Создание таблицы Compilation
CREATE TABLE Compilation (
    CompID SERIAL primary key,
    title VARCHAR(100) not null,
    release_year INTEGER not null
);

-- Создание таблицы связи CompilationTrack
CREATE TABLE CompilationTrack (
    CompTrackID SERIAL primary key,
    CompID INTEGER references Compilation(CompID),
    TrackID INTEGER references Track(TrackID),
    unique (CompID, TrackID)
);