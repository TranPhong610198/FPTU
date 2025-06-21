package entity;

public class Category {
    private int id;
    private String name;
    private String description;
    private Integer parentId;  // Can be null
    private int level;
    private String status;
    private String parentName;
    public Category() {
    }

    public Category(int id, String name, String description, Integer parentId, int level, String status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.parentId = parentId;
        this.level = level;
        this.status = status;
        this.parentName = parentName;
    }

    // Getters and Setters
    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}