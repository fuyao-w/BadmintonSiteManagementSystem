package service;

import beans.MemberBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import mapper.*;
import mvc.orderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DeadlockLoserDataAccessException;
import org.springframework.stereotype.Service;
import bean.*;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

@Service
@Scope("session")
public class hzpservice implements Serializable {
    @Autowired
    saleMapper saleMapper;
    @Autowired
    memberMapper memberMapper;
    @Autowired
    prepMapper prepMapper;
    @Autowired
    ddMapper ddMapper;
    @Autowired
    tdMapper tdMapper;
    @Autowired
    adminMapper adminMapper;


    static volatile sale msale;


    private static ConcurrentHashMap<Integer, sale> hashMap = new ConcurrentHashMap<>();

    private sale getSale(int id) {
         sale sale = hashMap.get(id);


        if (sale != null) {
            for (Map.Entry<Integer, sale> entry : hashMap.entrySet()) {
                System.out.println("遍历：" + entry.getKey());
            }
            return sale;
        } else {


            sale = saleMapper.selByID(id);
            hashMap.put(id, sale);

            return sale;
        }
    }

    private void setSale(int id) {
        hashMap.get(id).setDj(0);
    }

    public LinkedList<sale> get5Mes() {


        LinkedList<sale> sales = saleMapper.get10PTrave();
        System.out.println("收到场地请求" + sales.size());
        return sales;
    }


    public PageInfo<sale> getallMes(int curPage) {
        System.out.println("开始查询博客");
        int pagesize = 5;
        PageHelper.startPage(curPage, pagesize);
        List<sale> list = saleMapper.getall();

        PageInfo<sale> pageInfo = new PageInfo<>(list);
        list.stream().forEach(o -> o.getAddtime());
        return pageInfo;

    }

    public PageInfo<member> getMembers(int curPage) {
        System.out.println("开始查询会员" + curPage);
        int pagesize = 5;
        PageHelper.startPage(curPage, pagesize);
        LinkedList<member> list = memberMapper.getAll();
        PageInfo<member> pageInfo = new PageInfo<>(list);
        list.stream().forEach(o -> o.getLastip());
        return pageInfo;

    }

    public PageInfo<dd> getdds(int curPage) {
        System.out.println("开始查询预订" + curPage);
        int pagesize = 5;
        PageHelper.startPage(curPage, pagesize);
        LinkedList<dd> list = ddMapper.getdds();
        PageInfo<dd> pageInfo = new PageInfo<>(list);
        list.stream().forEach(o -> o.getDdid());
        return pageInfo;

    }

    public PageInfo<dd> getfhdds(int curPage) {
        System.out.println("开始查询..预订" + curPage);
        int pagesize = 5;
        PageHelper.startPage(curPage, pagesize);
        LinkedList<dd> list = ddMapper.getfhdds();
        PageInfo<dd> pageInfo = new PageInfo<>(list);
        list.stream().forEach(o -> o.getDdid());
        return pageInfo;

    }


    // @Transactional(isolation = Isolation.SERIALIZABLE,timeout = 10)
    public void chaMmempw(String username, String oldpwd, String newpwd) {

        if (memberMapper.selByUsername(username).equals(oldpwd)) {
            System.out.println("可以修改");
            String password = newpwd;
            memberMapper.uppw(username, password);
        }


    }

    @Transactional(isolation = Isolation.SERIALIZABLE, timeout = 10)
    public void subtd(td td) {
        if (td.getId() == null) {
            tdMapper.insert(td);

        } else {
            tdMapper.subgl(td);
        }


    }

    @Transactional(isolation = Isolation.SERIALIZABLE, timeout = 10)
    public void updd(dd dd) {
        ddMapper.indd(dd);
        prepMapper.upzt(dd.getDdid());


    }

    public int deladmin(String username) {
        return adminMapper.deladmin(username);


    }

    public int delcourt(Integer id) {
        return saleMapper.delByID(id);


    }

    public String upcourt(sale sale) {

        if (saleMapper.insertSale(sale) == 1)
            return "上传成功";
        else
            return "上传失败";
    }


    public int delorin(String username, String password) {
        if (adminMapper.selectAdminByame(username) != null)
            return adminMapper.updateUsername(password, username);
        else {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            admin admin = new admin();
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setCreattime(simpleDateFormat.format(new Date()));
            admin.setFlag(2);
            admin.setIsuse(1);
            admin.setQuanxian(11);
            return adminMapper.insert(admin);
        }


    }


    public String prep(int id, prep prep) {
        System.out.println("执行方法");
        String mes = "预订成功";

        msale = getSale(id);

        System.out.println(msale);
        System.out.println("场地信息" + msale.getDj());
        synchronized (msale) {
            System.out.println("获得锁");
            if (msale.getDj() == 1) {


                prep.setTitle(msale.getTitle());
                System.out.println("取得预订，" + prep.getTitle() + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));


//                try {
//                    Thread.sleep(5000);
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
                System.out.println("继续处理" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
                prep.setDdid(String.valueOf(System.currentTimeMillis()));


                System.out.println("更新完成");
                System.out.println("场地信息" + msale.getDj());

                orderUtil.order(saleMapper, prepMapper, id, prep);

                setSale(id);


            } else {
                mes = "场地已被预订";
            }
        }

        return mes;
    }

}
