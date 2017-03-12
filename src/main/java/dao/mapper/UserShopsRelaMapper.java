package dao.mapper;

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
}