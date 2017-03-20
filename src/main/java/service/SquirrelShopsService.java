package service;

import pojo.dto.SquirrelShopsDto;
import pojo.entity.SquirrelShops;

import java.util.List;

/**
 * Created by Administrator on 2017/2/27.
 */
public interface SquirrelShopsService {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelShops record);

    int insertSelective(SquirrelShops record);

    SquirrelShops selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelShops record);

    int updateByPrimaryKey(SquirrelShops record);

    SquirrelShops selectByShopperKepper(Integer userId);

    List<SquirrelShops> selectAll();

    List<SquirrelShopsDto> selectAllDto();

    List<SquirrelShops> selectAllWithPage(Integer pageIndex);

    List<SquirrelShopsDto> selectBySalesDesc(Integer sales);
}
