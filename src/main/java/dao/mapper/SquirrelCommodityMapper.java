package dao.mapper;

import org.apache.ibatis.annotations.Param;
import pojo.dto.SquirrelCommodityDto;
import pojo.entity.SquirrelCommodity;
import pojo.entity.SquirrelShops;

import java.util.List;

public interface SquirrelCommodityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelCommodity record);

    int insertSelective(SquirrelCommodity record);

    SquirrelCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelCommodity record);

    int updateByPrimaryKey(SquirrelCommodity record);

    List<SquirrelCommodity> selectByShopId(Integer id);

    List<SquirrelCommodityDto> selectDtoByNameShopIdClassIdAndSortType(@Param("name") String name, @Param("shopsId") Integer shopId, @Param("classId") Integer classId);

    List<SquirrelCommodityDto> selectHotListId();

    SquirrelCommodity selectCommodityBySales(Integer sales);
}