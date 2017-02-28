package service;

import pojo.entity.SquirrelCommodity;

/**
 * Created by Administrator on 2017/2/27.
 */
public interface SquirrelCommodityService {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelCommodity record);

    int insertSelective(SquirrelCommodity record);

    SquirrelCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelCommodity record);

    int updateByPrimaryKey(SquirrelCommodity record);
}
