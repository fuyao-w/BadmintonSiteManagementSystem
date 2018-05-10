package service;

import bean.affiche;
import mapper.afficheMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.Constant;
import util.DBO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class announceService {
    private String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
    @Autowired
    private affiche affiche;

    @Autowired
    private afficheMapper afficheMapper;

    public int addAffiche(affiche affiche) {
//        String sql = "insert into affiche (title,content,addtime,adder,ifhide) " +
//                "values ('"+title+"','"+content+"','"+date+"','"+adder+"','"+ifhide+"')";

        if (1 == afficheMapper.insert(affiche)) {
            return Constant.SUCCESS;
        } else {
            return Constant.SYSTEM_ERROR;
        }

    }

    //	update affiche
    public int updateAffiche(affiche affiche) {
//        String sql = "update affiche set title = '"+title+"',content='"+content+"',addtime='"+date+"'," +
//                "adder='"+adder+"',ifhide='"+ifhide+"' where id = '"+id+"' ";


        if (1 == afficheMapper.updataAnnounce(affiche)) {
            return Constant.SUCCESS;
        } else {
            return Constant.SYSTEM_ERROR;
        }

    }

    //delete affiche
    public int delAffiche(int id[]) {

        for (int i = 0; i < id.length; i++) {
            afficheMapper.delAnnounce(i);
        }
        return Constant.SUCCESS;

    }

    //open.close affiche
//    public int hideAffiche(int id) {
//        String sql = "update affiche set ifhide='1' where id='" + id + "'";
//        String sql2 = "update affiche set ifhide='0' where id='" + id + "'";
//        String sql3 = "select ifhide from affiche where id='" + id + "'";
//        DBO dbo = new DBO();
//        dbo.open();
//        try {
//            rs = dbo.executeQuery(sql3);
//            rs.next();
//            int i = rs.getInt(1);
//            if (i == 1) {
//                int flag = dbo.executeUpdate(sql2);
//                if (flag == 1)
//                    return Constant.SUCCESS;
//                else
//                    return Constant.SYSTEM_ERROR;
//            } else {
//                int flag = dbo.executeUpdate(sql);
//                if (flag == 1)
//                    return Constant.SUCCESS;
//                else
//                    return Constant.SYSTEM_ERROR;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return Constant.SYSTEM_ERROR;
//        } finally {
//            dbo.close();
//        }
//    }

    //	get one affiche to update
    public affiche getOneAffiche(int id) {
//        String sql = "select * from affiche where id = '"+id+"'";

        bean.affiche affiche = new affiche();
        affiche = afficheMapper.selOne(id);
        return affiche;
    }

    public List getAllAffiche() {
        List<affiche> affiches = new ArrayList<>();
        affiches = afficheMapper.selAll();
        return affiches;
    }

    public List getAllAfficheManage() {
//        String sql = "select id,title,addtime,adder,ifhide from affiche order by addtime desc ";
        List<affiche> affiches = new ArrayList<>();
        affiches = afficheMapper.getAllAfficheManage();
        return affiches;
    }


}
