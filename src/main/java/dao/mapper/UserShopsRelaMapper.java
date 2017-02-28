package dao.mapper;

import pojo.entity.UserShopsRela;

public interface UserShopsRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserShopsRela record);

    int insertSelective(UserShopsRela record);

    UserShopsRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserShopsRela record);

    int updateByPrimaryKey(UserShopsRela record);
}