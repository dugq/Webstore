package dao.mapper;

import pojo.entity.SquirrelCommodity;

import java.util.List;

public interface SquirrelCommodityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelCommodity record);

    int insertSelective(SquirrelCommodity record);

    SquirrelCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelCommodity record);

    int updateByPrimaryKey(SquirrelCommodity record);

    List<SquirrelCommodity> selectByShopId(Integer id);
}