package pojo.entity;

import java.io.Serializable;
import java.util.Date;

public class SquirrelClassification implements Serializable {
    private static final long serialVersionUID = -3272023305371868113L;
    private Integer id;

    private String name;

    private Date creationTime;

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
}