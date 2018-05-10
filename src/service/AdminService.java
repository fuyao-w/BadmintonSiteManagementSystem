package service;


import bean.*;

import mapper.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import util.Constant;
import util.DBO;
import util.MD5;


import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Scope("session")
public class AdminService implements Serializable{

    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    @Autowired
    private admin admin;

    @Autowired
    private adminMapper adminMapper;

    private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    public int adminLogin(String username,  String password) {
//    String sql = "select * from admin where username = '"+username+"' and isuse='1'";
//    String sql2 = "insert into adminlog(username,password,logintime,loginip,useros,ok) values('"+username+"','"+md5password+"','"+date+"','"+loginip+"','"+useros+"','true')";
//    String sql3 = "insert into adminlog(username,password,logintime,loginip,useros,ok) values('"+username+"','"+password+"','"+date+"','"+loginip+"','"+useros+"','false')";
//    String sql4 = "update admin set logintimes = logintimes+1 where username = '"+username+"' ";

//        SqlSession sqlSession = sqlSessionFactory.openSession();
//        saleMapper saleMapper =sqlSessionFactory.getConfiguration().getMapper(mapper.saleMapper.class,sqlSession);
//        sqlSession.close();

        String md5password = MD5.MD5(password);
        // String date = simpleDateFormat.format(new Date());

        admin = adminMapper.selectAdminByame(username);


        if (admin==null)
            return Constant.NAME_ERROR;

            if (admin.getPassword().trim().equals(md5password)) {

                adminMapper.updateTimes(username);

                return Constant.SUCCESS;
            } else {

                return Constant.PASSWORD_ERROR;
            }





    }


    public admin getAdminInfo(String username) {
        //String sql = "select * from admin where username='"+username+"' ";


        bean.admin admin1 = new admin();
        admin1 = adminMapper.selectAllByame(username);
        return admin1;

    }

//    public int editPassword(String username, String newpwd) {
//
//        String sql2 = "update admin set password = '" + newpwd + "' where username = '" + username + "'";
//
//        if (0 != adminMapper.selectCount(username, newpwd)) {
//
//            if (1 == adminMapper.updateUsername(newpwd, username)) {
//
//
//                return Constant.SUCCESS;
//
//
//            } else {
//
//
//                return Constant.PASSWORD_ERROR;
//            }
//        } else {
//            return Constant.SYSTEM_ERROR;
//        }
//    }


    public int addManager(admin admin) {

//        String sql = "insert into admin(username,password,creattime,flag,isuse,logintimes,quanxian) values('"+username+"','"+password+"','"+date+"','"+type+"','"+isuse+"','0','111')";
//        String sql2 = "select * from admin where username = '"+username+"'";
        if (0 != adminMapper.selectCountByname(admin.getUsername()))
            return Constant.SAME_NAME;
        else {

            if (1 == adminMapper.insert(admin))
                return Constant.SUCCESS;
            else return Constant.SYSTEM_ERROR;

        }
    }


    public int updateManager(admin admin) {


        if (1 == adminMapper.updateByPrimaryKey(admin)) return Constant.SUCCESS;
        else return Constant.SYSTEM_ERROR;

    }


    public LinkedList<admin> getAllManager(){
//        String sql = "select * from admin where flag !='1' order by id asc";
        LinkedList<admin> list = adminMapper.getAllManager();

        System.out.println("管理员时间"+" "+list.get(0).getCreattime());
            return list;

    }


    public int delManager(int id){
//        String sql = "delete from admin where id = '"+id+"'";

            if(1 == adminMapper.deleteByPrimaryKey(id))return Constant.SUCCESS;
            else return Constant.SYSTEM_ERROR;

    }

    public int changeAdminPw(String username,String oldpwd,String newpwd){
//        String sql = "delete from admin where id = '"+id+"'";

        Integer i = adminMapper.selectAdminByNameAndPwd(username,oldpwd);
        System.out.println(oldpwd+" "+newpwd);
        if (i!= null){
            String password = newpwd;
           int a = adminMapper.updateUsername(password,username);
            System.out.println("几个？ "+a);
           if (a!=1){
               return Constant.DEFAULT_ERROR;
           }else {
               return  Constant.SUCCESS;
           }

        }
        else {
            return Constant.PASSWORD_ERROR;
        }


//        if(1 == adminMapper.deleteByPrimaryKey(id))return Constant.SUCCESS;
//        else return Constant.SYSTEM_ERROR;

    }


}
