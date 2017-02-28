package dao.mapper;

import pojo.entity.SquirrelCommodity;

public interface SquirrelCommodityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelCommodity record);

    int insertSelective(SquirrelCommodity record);

    SquirrelCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelCommodity record);

    int updateByPrimaryKey(SquirrelCommodity record);
}