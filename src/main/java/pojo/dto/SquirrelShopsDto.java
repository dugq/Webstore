package pojo.dto;

import pojo.entity.SquirrelShops;

/**
 * Created by duq on 2017/3/10.
 */
public class SquirrelShopsDto extends SquirrelShops {

    private static final long serialVersionUID = -7212101885549168278L;

    private String shopkeeperName;

    public String getShopkeeperName() {
        return shopkeeperName;
    }

    public void setShopkeeperName(String shopkeeperName) {
        this.shopkeeperName = shopkeeperName;
    }
}
