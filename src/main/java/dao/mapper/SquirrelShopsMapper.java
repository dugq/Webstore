package dao.mapper;

import pojo.entity.SquirrelShops;

public interface SquirrelShopsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelShops record);

    int insertSelective(SquirrelShops record);

    SquirrelShops selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelShops record);

    int updateByPrimaryKey(SquirrelShops record);
}