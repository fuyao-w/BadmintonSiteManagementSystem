package mapper;

import bean.member;
import org.apache.ibatis.annotations.Param;

import java.util.LinkedList;

public interface memberMapper {

    int insert(member member);
    String selByUsername(String username);


    int delByID(Integer id);

    int upuse(@Param("ifuse") Integer ifuse,@Param("id") Integer id);
    int uppw(@Param("username") String username,@Param("password") String password);
    int upnpw( String username);

    LinkedList<member> getAll();
    member selall(@Param("username") String username, @Param("password") String password);

   
}