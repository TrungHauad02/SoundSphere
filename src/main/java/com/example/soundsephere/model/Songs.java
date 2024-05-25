package com.example.soundsephere.model;

import com.example.soundsephere.enumModel.EnumStatus;

public class Songs {
    private String id;
    private String title;
    private String id_artist;
    private String genre_id;
    private String description;
    private int time_play;
    private String song_data;
    private String image;
    private String lyric;
    private float rating;

    private String artistName;
    private EnumStatus status;

    private  Genre genre;

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }
    // get artist
    private Users users;

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
    //
    public Songs() {
    }
    public Songs(String id, String title, String id_artist, String genre_id, String description,
                 int time_play, String song_data, String image, String lyric, float rating, EnumStatus status) {
        this.id = id;
        this.title = title;
        this.id_artist = id_artist;
        this.genre_id = genre_id;
        this.description = description;
        this.time_play = time_play;
        this.song_data = song_data;
        this.image = image;
        this.lyric = lyric;
        this.rating = rating;
        this.status = status;
    }


    public Songs(String id, String title, String artistName, String img) {
        this.id = id;
        this.title = title;
        this.artistName = artistName;
        this.image = img;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getId_artist() {
        return id_artist;
    }

    public void setId_artist(String id_artist) {
        this.id_artist = id_artist;
    }

    public String getGenre_id() {
        return genre_id;
    }

    public void setGenre_id(String genre_id) {
        this.genre_id = genre_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTime_play() {
        return time_play;
    }

    public void setTime_play(int time_play) {
        this.time_play = time_play;
    }

    public String getSong_data() {
        return song_data;
    }

    public void setSong_data(String song_data) {
        this.song_data = song_data;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLyric() {
        return lyric;
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public EnumStatus getStatus() {
        return status;
    }

    public void setStatus(EnumStatus status) {
        this.status = status;
    }

    public String getArtistName() {
        return artistName;
    }

    public void setArtistName(String artistName) {
        this.artistName = artistName;
    }
}
