package service;

import pojo.entity.UserShopsRela;

/**
 * Created by Administrator on 2017/2/27.
 */
public interface UserShopsRelaService {
    int deleteByPrimaryKey(Integer id);

    int insert(UserShopsRela record);

    int insertSelective(UserShopsRela record);

    UserShopsRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserShopsRela record);

    int updateByPrimaryKey(UserShopsRela record);
}
