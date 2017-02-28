package pojo.entity;

import java.util.Date;

public class SquirrelShops {
    private Integer id;

    private String name;

    private Date creationTime;

    private Integer shopkeeper;

    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public Integer getShopkeeper() {
        return shopkeeper;
    }

    public void setShopkeeper(Integer shopkeeper) {
        this.shopkeeper = shopkeeper;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}