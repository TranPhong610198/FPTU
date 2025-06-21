package entity;

import java.sql.Date;

public class Slider {
    private int id;
    private String title;
    private String image_url;        // Changed from imageUrl
    private String link;     // Changed from link
    private String status;
    private int display_order;    // Already matches
    private String notes;         // Changed from notes

    public Slider() {
    }

    public Slider(int id, String title, String image_url, String link, String status, 
                 int display_order, String notes) {
        this.id = id;
        this.title = title;
        this.image_url = image_url;
        this.link = link;
        this.status = status;
        this.display_order = display_order;
        this.notes = notes;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(int display_order) {
        this.display_order = display_order;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
      
}