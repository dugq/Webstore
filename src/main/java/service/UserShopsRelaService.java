package service;

import pojo.dto.UserShopsRelaDto;
import pojo.entity.UserShopsRela;

import java.util.List;

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

    List<UserShopsRelaDto> selectDtosByUserId(Integer userId);

    List<UserShopsRelaDto> selectDtosByShopIdAndStutas(Integer pageIndex, Integer shopId,Byte status);

}
