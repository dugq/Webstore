package dao.mapper;

import pojo.entity.SquirrelClassification;

public interface SquirrelClassificationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelClassification record);

    int insertSelective(SquirrelClassification record);

    SquirrelClassification selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelClassification record);

    int updateByPrimaryKey(SquirrelClassification record);
}