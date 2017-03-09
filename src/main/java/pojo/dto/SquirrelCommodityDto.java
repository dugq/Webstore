package pojo.dto;

import pojo.entity.SquirrelCommodity;

/**
 * Created by Administrator on 2017/3/9.
 */
public class SquirrelCommodityDto extends SquirrelCommodity {
    private static final long serialVersionUID = 4887241853766284029L;
    private int saleNum;

    public int getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(int saleNum) {
        this.saleNum = saleNum;
    }
}
