package dao.mapper;

import pojo.dto.SquirrelClassificationDto;
import pojo.entity.SquirrelClassification;

import java.util.List;

public interface SquirrelClassificationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelClassification record);

    int insertSelective(SquirrelClassification record);

    SquirrelClassification selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelClassification record);

    int updateByPrimaryKey(SquirrelClassification record);

    List<SquirrelClassificationDto> selectAllDtos();

    List<SquirrelClassification> selectByName(String name);
}