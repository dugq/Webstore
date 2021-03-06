package pojo.entity;

import java.io.Serializable;
import java.util.Date;

public class UserShopsRela implements Serializable{
    private static final long serialVersionUID = 5315642886684412612L;
    private Integer id;

    private Integer userId;

    private Integer shopId;

    private Date creationTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }
}