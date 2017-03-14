package dao.mapper;

import org.apache.ibatis.annotations.Param;
import pojo.dto.UserShopsRelaDto;
import pojo.entity.UserShopsRela;

import java.util.List;

public interface UserShopsRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserShopsRela record);

    int insertSelective(UserShopsRela record);

    UserShopsRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserShopsRela record);

    int updateByPrimaryKey(UserShopsRela record);

    List<UserShopsRelaDto> selectDtosByUserId(Integer userId);

    List<UserShopsRelaDto> selectDtosByShopIdAndStatus(@Param("shopId") Integer shopId, @Param("status") Byte status);
}