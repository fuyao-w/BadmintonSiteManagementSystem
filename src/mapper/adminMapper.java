package mapper;

import bean.admin;
import org.apache.ibatis.annotations.Param;

import java.util.LinkedList;
import java.util.List;

public interface adminMapper {
    admin selectAdminByame(String username);

    admin  selectAllByame(String username);

    int  selectCount(@Param("username") String username ,@Param("password")String password);
    int  selectAdminByNameAndPwd(@Param("username")String username ,@Param("oldpwd")String oldpwd);
    int  selectCountByname(@Param("username") String username);

    LinkedList<admin> getAllManager();


    int insert(admin record);
    int deleteByPrimaryKey(Integer id);
    int deladmin(String username);

    int insertSelective(admin record);

    admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(admin admin);
    int updateTimes(String username);

    int updateUsername(@Param("password")String password, @Param("username")String username);
}