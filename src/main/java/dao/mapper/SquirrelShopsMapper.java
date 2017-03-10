package dao.mapper;

import pojo.dto.SquirrelShopsDto;
import pojo.entity.SquirrelShops;

import java.util.List;

public interface SquirrelShopsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelShops record);

    int insertSelective(SquirrelShops record);

    SquirrelShops selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelShops record);

    int updateByPrimaryKey(SquirrelShops record);

    SquirrelShops selectByShopperKepper(Integer userId);

    List<SquirrelShops> selectAll();

    List<SquirrelShopsDto> selectAllDto();
}