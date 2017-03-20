package service;

import pojo.dto.Pagination;
import pojo.dto.SquirrelCommodityDto;
import pojo.entity.SquirrelCommodity;
import pojo.entity.SquirrelShops;

import java.util.List;

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

    List<SquirrelCommodity> selectByShopId(Integer id, Pagination page);

    List<SquirrelCommodityDto> selectDtoByNameShopIdClassIdAndSortType(String name, Integer shopId, Integer classId, String sortType,int pageIndex);

    List<SquirrelCommodityDto> selectHotList();

    SquirrelCommodity selectCommodityBySales(Integer sales);
}
