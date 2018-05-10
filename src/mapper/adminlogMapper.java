package mapper;

import bean.adminlog;

public interface adminlogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(adminlog record);

    int insertSelective(adminlog record);

    adminlog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(adminlog record);

    int updateByPrimaryKey(adminlog record);
}