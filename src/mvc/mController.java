package mvc;

import bean.*;
import beans.MemberBean;
import com.github.pagehelper.PageInfo;

import com.sun.org.apache.xpath.internal.operations.Mod;
import mapper.*;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import service.AdminService;
import service.hzpservice;
import util.Constant;
import util.Filter;
import util.MD5;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.Executors;

@Controller
@RequestMapping("/")
@Scope("session")
public class mController implements Serializable {


    @Autowired
    hzpservice hzpservice;
    @Autowired
    private adminMapper adminMaper;
    @Autowired
    private saleMapper saleMapper;
    @Autowired
    private memberMapper memberMapper;
    @Autowired
    private pmemberMapper pmemberMapper;
    @Autowired
    private prepMapper prepMapper;
    @Autowired
    private ddMapper ddMapper;
    @Autowired
    private tdMapper tdMapper;
    @Autowired
    AdminService adminService;

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
    private String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {
        System.out.println("接受请求");
        System.out.println(this + " " + hzpservice);
        LinkedList<sale> sale1s = hzpservice.get5Mes();
        model.addAttribute("sales", sale1s);


        return "index";

    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        System.out.println("接受请求管理员登录");


        return "admin/login";

    }

    @RequestMapping(value = "/hinf", method = RequestMethod.GET)
    public ModelAndView hinf(int id) {
        System.out.println("单页" + id);

        sale sale = saleMapper.selByID(id);


        return new ModelAndView("hinfo", "sale", sale);

    }

    @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    public String adminlogin(HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password, Model model) {
        System.out.println("接受请求管理员登录" + username + " " + password);
        ModelAndView modelAndView = new ModelAndView();
        // adminService.adminLogin(username,password);

        if (username == null || username.trim().equals("")) {
            model.addAttribute("message", "请输入用户名！");
            return "admin/login";
        } else if (password == null || password.trim().equals("")) {

            model.addAttribute("message", "请输入密码！");
            return "admin/login";
        }


        int flag = adminService.adminLogin(username, password);


        switch (flag) {
            case Constant.SUCCESS:
                admin list = adminMaper.selectAllByame(username);
                session.setAttribute("user", username);
                session.setAttribute("list", list);
                System.out.println("登陆成功" + list.getCreattime());
                model.addAttribute("message", "登陆成功！");
                return "admin/index";

            case Constant.NAME_ERROR:
                model.addAttribute("message", "用户名错误！请确认管理权限！");
                return "admin/login";
            // request.getRequestDispatcher(sysdir+"/login.jsp").forward(request, response);

            case Constant.PASSWORD_ERROR:
                model.addAttribute("message", "密码错误，请确认管理权限！");
                return "admin/login";
//                request.getRequestDispatcher(sysdir+"/login.jsp").forward(request, response);

            default:
                model.addAttribute("message", "错误！");
                return "admin/login";

        }


    }

    @RequestMapping(value = "/alladmin", method = RequestMethod.GET)
    public String getallmenber(Model model) {
        System.out.println("所有管理员");

        LinkedList<admin> admins = adminService.getAllManager();
        model.addAttribute("admins", admins);


        return "/admin/system/user";

    }

    @RequestMapping(value = "/deladmin", method = RequestMethod.GET)
    public String deladmin(Model model, @RequestParam("username") String username, HttpServletRequest request) {
        System.out.println("删除管理员" + username);


        if (hzpservice.deladmin(username) == 1) {
            request.setAttribute("message", "操作成功");
        } else
            request.setAttribute("message", "操作失败");
        LinkedList<admin> admins = adminService.getAllManager();
        model.addAttribute("admins", admins);
        return "/admin/system/user";

    }

    @RequestMapping(value = "/delmen", method = RequestMethod.GET)
    public String delmen(Integer id, HttpServletRequest request) {
        System.out.println("删除会员" + id);
        if (memberMapper.delByID(id) == 1)
            request.setAttribute("message", "操作成功");
        else
            request.setAttribute("message", "操作失败");


        return "admin/member/person";

    }

    @RequestMapping(value = "/setuse", method = RequestMethod.GET)
    public String setuse(@RequestParam("ifuse") Integer ifuse, @RequestParam("id") Integer id, HttpServletRequest request) {

        System.out.println("设置会员" + ifuse);
        if (ifuse == 1)
            ifuse = 0;
        else
            ifuse = 1;
        if (memberMapper.upuse(ifuse, id) == 1)
            request.setAttribute("message", "操作成功");
        else
            request.setAttribute("message", "操作失败");


        return "admin/member/person";

    }
    @RequestMapping(value = "/setprep", method = RequestMethod.GET)
    public String setprep(@RequestParam("dj") Integer dj, @RequestParam("id") Integer id, HttpServletRequest request) {

        System.out.println("设置预订" + dj);
        if (dj == 1)
            dj = 0;
        else
            dj = 1;
        if (saleMapper.uppdj(dj,id) == 1)
            request.setAttribute("message", "操作成功");
        else
            request.setAttribute("message", "操作失败");


        return "admin/hzp/index";

    }


    @RequestMapping(value = "/delorinsert", method = RequestMethod.POST)
    public String deladmin(Model model, @RequestParam("username") String username
            , @RequestParam("password") String password, HttpServletRequest request) {
        System.out.println("修改管理员" + username);

        if (hzpservice.delorin(username, password) == 1)
            request.setAttribute("message", "操作成功");
        LinkedList<admin> admins = adminService.getAllManager();
        model.addAttribute("admins", admins);
        model.addAttribute("admins", admins);
        return "/admin/system/user";

    }

    @RequestMapping(value = "/changeAdmPwd", method = RequestMethod.POST)
    public String changeAdminPassword(@RequestParam("oldpwd") String oldpwd, @RequestParam("newpwd") String newpwd,
                                      HttpServletRequest request, Model model) {


        System.out.println("改管理员密码");

        int i = adminService.changeAdminPw((String) request.getSession().getAttribute("user"), MD5.MD5(oldpwd), MD5.MD5(newpwd));


        switch (i) {
            case 1:
                model.addAttribute("message", "修改成功！");
                break;
            case 0:
                model.addAttribute("message", "修改失败！");
                break;
            case 3:
                model.addAttribute("message", "密码错误！");
                break;
            default:
        }


        return "/admin/system/editpwd";

    }

    @RequestMapping(value = "/court", method = RequestMethod.GET)
    public ModelAndView court(@RequestParam("id") Integer id) {
        System.out.println("场地");

        sale sale = saleMapper.selByID(id);

        System.out.println(sale.getAddtime());
        return new ModelAndView("hinfo", "sale", sale);

    }

    @RequestMapping(value = "/cdxx", method = RequestMethod.GET)
    public ModelAndView cdxx() {
        System.out.println("场地信息");

        LinkedList<sale> sale = saleMapper.getallPTrave();


        return new ModelAndView("nhzp", "hotlist", sale);

    }

    @RequestMapping(value = "/prepinfo", method = RequestMethod.GET)
    public ModelAndView prepinfo(@RequestParam("id") Integer id) {
        System.out.println("预订");
        System.out.println(id);


        sale sale = saleMapper.selByID(id);

        return new ModelAndView("prepinfo", "sale", sale);

    }

    @RequestMapping(value = "/deldd", method = RequestMethod.GET)
    public String deldd(@RequestParam("id") Integer id) {
        System.out.println("删除预订");
        System.out.println(id);

        ddMapper.deldd(id);


        return "admin/prep/prep";

    }

    @RequestMapping(value = "/setdd", method = RequestMethod.GET)
    public String setdd(@RequestParam("id") Integer id) {
        System.out.println("处理预订");
        System.out.println(id);

        ddMapper.setdd(id);
        union union = ddMapper.undd(id);
        System.out.println("联查结果" + union.getTitle());
        saleMapper.updj1(union.getTitle());
//saleMapper.updj1()

        return "admin/prep/prep";

    }


    @RequestMapping(value = "/courtadmin", method = RequestMethod.GET)
    public ModelAndView court() {
        System.out.println("场地管理");
        LinkedList<sale> sale1s = hzpservice.get5Mes();

        return new ModelAndView("admin/hzp/index", "sales", sale1s);

    }

    @RequestMapping(value = "/allcourts", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<sale> courts(@RequestParam("curPage") Integer curPage) {
        System.out.println("获取分页数" + curPage);
        PageInfo<sale> sales = hzpservice.getallMes(curPage);
        return sales;

    }

    @RequestMapping(value = "/delhzp", method = RequestMethod.GET)

    public String delcourt(Integer id, HttpServletRequest request) {
        System.out.println("删除场地" + id);
        if (hzpservice.delcourt(id) == 1) {
            request.setAttribute("message", "操作成功");
        } else
            request.setAttribute("message", "操作失败");
        request.setAttribute("message", "操作失败");
        return "admin/hzp/index";
    }


    @RequestMapping(value = "/menbersadmin", method = RequestMethod.GET)
    public String adminMember() {
        System.out.println("会员管理");


        return "admin/member/person";

    }

    @RequestMapping(value = "/prepadmin", method = RequestMethod.GET)
    public String prepadmin() {
        System.out.println("预订管理");


        return "admin/prep/prep";

    }

    @RequestMapping(value = "/fhadmin", method = RequestMethod.GET)
    public String prepfhadmin() {
        System.out.println("..管理");


        return "admin/prep/fh";

    }

    @RequestMapping(value = "/getmenbers", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<member> getMenbers(@RequestParam("curPage") Integer curPage) {
        System.out.println("取得会员信息，页数" + curPage);

        PageInfo<member> members = hzpservice.getMembers(curPage);


        return members;

    }

    @RequestMapping(value = "/getpreps", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<dd> getpreps(@RequestParam("curPage") Integer curPage) {
        System.out.println("取得预订信息，页数" + curPage);

        PageInfo<dd> preps = hzpservice.getdds(curPage);


        return preps;

    }

    @RequestMapping(value = "/getfhpreps", method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<dd> getfhpreps(@RequestParam("curPage") Integer curPage) {
        System.out.println("取得预订信息，页数" + curPage);

        PageInfo<dd> preps = hzpservice.getfhdds(curPage);


        return preps;

    }

    @RequestMapping(value = "/gettds", method = RequestMethod.GET)
    public String gettds(HttpServletRequest request) {
        System.out.println("取得管理人员信息，页数");

        LinkedList<td> tds = tdMapper.gettds();
        request.setAttribute("tds", tds);


        return "admin/gl/index";

    }

    @RequestMapping(value = "/delgl", method = RequestMethod.GET)
    public String gettds(@RequestParam("id") Integer id, HttpServletRequest request) {
        System.out.println("删除，页数" + id);
        if (tdMapper.delgl(id) == 1)
            request.setAttribute("message", "删除成功");
        else
            request.setAttribute("message", "删除失败");
        LinkedList<td> tds = tdMapper.gettds();
        request.setAttribute("tds", tds);
        return "admin/gl/index";

    }

    @RequestMapping(value = "/setGl", method = RequestMethod.GET)
    public String setGl() {

        return "admin/gl/add";

    }

    @RequestMapping(value = "/setgl", method = RequestMethod.GET)
    public ModelAndView setgl(@RequestParam("id") Integer id, HttpServletRequest request) {
        System.out.println("修改管理，页数" + id);
        td td = tdMapper.gettd(id);


        return new ModelAndView("admin/gl/add", "td", td);

    }

    @RequestMapping(value = "/mempw", method = RequestMethod.POST)
    public String mempw(@RequestParam("username") String username, @RequestParam("oldpwd") String oldpwd
            , @RequestParam("newpwd") String newpwd, HttpServletRequest request, HttpSession session) {
        System.out.println("修改会员密码" + oldpwd + " " + newpwd);

        hzpservice.chaMmempw(username, oldpwd, newpwd);
        request.setAttribute("message", "操作完成");
        session.setAttribute("member", username);
        session.setAttribute("type", "reg_type");

        return "member/info/editpwd";

    }

    @RequestMapping(value = "/subgl", method = RequestMethod.POST)
    public ModelAndView subgl(td td, HttpServletResponse response, HttpServletRequest request) {
        try {
            td.setXm(new String(td.getXm().getBytes("iso-8859-1"), "utf-8"));
            td.setDz(new String(td.getDz().getBytes("iso-8859-1"), "utf-8"));
            td.setBz(new String(td.getBz().getBytes("iso-8859-1"), "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }


        if (td.getXb().equals("1"))
            td.setXb("男");
        else
            td.setXb("女");
//        System.out.println("姓名"+td.getXm());
        System.out.println("提交管理，页数" + td.getSfz());

        hzpservice.subtd(td);

        LinkedList<td> tds = tdMapper.gettds();
        request.setAttribute("tds", tds);

        return new ModelAndView("admin/gl/index", "td", td);

    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)

    public String login(@RequestParam("username") String username, @RequestParam("password") String password
            , HttpServletRequest request, HttpSession session) throws Exception {
        System.out.println(username + " " + password);
        member member = memberMapper.selall(username, password);

        if (member == null) {
            request.setAttribute("message", "账号或密码错误");

            return "login";
        } else
            session.setAttribute("member", member.getUsername());
        session.setAttribute("type", member.getType());
        return "member/index";


    }

    @RequestMapping(value = "/addprep", method = RequestMethod.POST)
    public String addprep(@RequestParam("sid") int sid, prep prep, HttpServletRequest request) throws UnsupportedEncodingException {
        //int id = sid;
prep.setTitle(new String(prep.getTitle().getBytes("iso-8859-1"),"utf-8"));
        request.setAttribute("message", hzpservice.prep(sid, prep));
        return "index";

    }

    @RequestMapping(value = "/infos", method = RequestMethod.GET)
    public ModelAndView infos(@RequestParam("mid") Integer mid) {
        System.out.println("详细信息" + mid);
        pmember pmember = pmemberMapper.selectByPrimaryKey(mid);
        return new ModelAndView("member/info/info", "pmember", pmember);

    }

    @RequestMapping(value = "/memprep", method = RequestMethod.GET)
    public String memprep(@RequestParam("member") String member, HttpServletRequest request) {

        System.out.println("会员预订" + member);
        LinkedList<prep> preps = prepMapper.getallprep(member);

        request.setAttribute("preps", preps);
        return "member/prep/index";

    }


    @RequestMapping(value = "/submem", method = RequestMethod.POST)
    public ModelAndView infos(pmember pmember, HttpServletRequest request, HttpServletResponse response) {
        System.out.println(response.getCharacterEncoding());
        try {
            pmember.setRealname(new String(pmember.getRealname().getBytes("ISO-8859-1"), "utf-8"));
            pmember.setAddress(new String(pmember.getAddress().getBytes("ISO-8859-1"), "utf-8"));
            pmember.setAnswer(new String(pmember.getAnswer().getBytes("ISO-8859-1"), "utf-8"));
            pmember.setCity(new String(pmember.getCity().getBytes("ISO-8859-1"), "utf-8"));
            pmember.setQuestion(new String(pmember.getQuestion().getBytes("ISO-8859-1"), "utf-8"));
            pmember.setSheng(new String(pmember.getSheng().getBytes("ISO-8859-1"), "utf-8"));
            pmember.setSex(new String(pmember.getSex().getBytes("ISO-8859-1"), "utf-8"));
            pmember.setBir(new String(pmember.getBir().getBytes("ISO-8859-1"), "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println("修改会员信息" + pmember.getAddress());
        pmemberMapper.updateByPrimaryKeySelective(pmember);
        pmember = pmemberMapper.selectByPrimaryKey(pmember.getMid());
        request.setAttribute("message", "成功");
        return new ModelAndView("member/info/info", "pmember", pmember);

    }


    @RequestMapping(value = "/delprep", method = RequestMethod.GET)
    public String delprep(@RequestParam("id") Integer id, @RequestParam("member") String member, HttpServletRequest request) {
        System.out.println("删除预订" + member + "  " + id);
        System.out.println(id);

        prepMapper.delprep(id);


        LinkedList<prep> preps = prepMapper.getallprep(member);

        request.setAttribute("preps", preps);
        return "member/prep/index";

    }

    @RequestMapping(value = "/chaprep", method = RequestMethod.GET)
    public String delprep(@RequestParam("id") Integer id, HttpServletRequest request) {
        System.out.println("修改预订" + id);
        System.out.println(id);

        prep prep = prepMapper.getPrepByid(id);
        request.setAttribute("list", prep);
        return "member/prep/up";

    }

    @RequestMapping(value = "/upPrep", method = RequestMethod.POST)
    public String delprep(prep prep, @RequestParam("member") String member, HttpServletRequest request) {
        System.out.println("修改预订" + prep.getLxfs());
        try {
//            prep.setTitle(new String(prep.getTitle().getBytes("iso-8859-1"),"utf-8"));
            prep.setLxfs(new String(prep.getLxfs().getBytes("iso-8859-1"), "utf-8"));
            prep.setLxr(new String(prep.getLxr().getBytes("iso-8859-1"), "utf-8"));
            prep.setSj(new String(prep.getSj().getBytes("iso-8859-1"), "utf-8"));
            prep.setTs(new String(prep.getTs().getBytes("iso-8859-1"), "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        prepMapper.upprep(prep);
        LinkedList<prep> preps = prepMapper.getallprep(member);

        request.setAttribute("preps", preps);
        return "member/prep/index";

    }

    @RequestMapping(value = "/addDD", method = RequestMethod.POST)
    public String addDD(@RequestParam("member") String member, @RequestParam("ddid") String ddid, HttpServletRequest request) {
        System.out.println("修改预订");
//        try {
////            prep.setTitle(new String(prep.getTitle().getBytes("iso-8859-1"),"utf-8"));
//            prep.setLxfs(new String(prep.getLxfs().getBytes("iso-8859-1"),"utf-8"));
//            prep.setLxr(new String(prep.getLxr().getBytes("iso-8859-1"),"utf-8"));
//            prep.setSj(new String(prep.getSj().getBytes("iso-8859-1"),"utf-8"));
//            prep.setTs(new String(prep.getTs().getBytes("iso-8859-1"),"utf-8"));
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }

        dd dd = new dd();
        dd.setDdid(ddid);
        dd.setAddtime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
        dd.setFkfs("");
        dd.setMember("现场支付");
        dd.setZt("未处理");
        dd.setMember(member);
        hzpservice.updd(dd);
        LinkedList<prep> preps = prepMapper.getallprep(member);

        request.setAttribute("preps", preps);

        return "member/prep/index";

    }

    @RequestMapping(value = "/stj", method = RequestMethod.GET)
    public String stj(@RequestParam("member") Integer member, HttpServletRequest request) {
        System.out.println("查看预订" + member);

        LinkedList<dd> dds = ddMapper.getAllprepdd(member);

        request.setAttribute("dds", dds);


        return "member/prep/tj";

    }

    @RequestMapping(value = "/sfh", method = RequestMethod.GET)
    public String sfh(@RequestParam("member") Integer member, HttpServletRequest request) {
        System.out.println("查看处理" + member);

        LinkedList<dd> dds = ddMapper.getAlldd(member);

        request.setAttribute("dds", dds);


        return "member/prep/fh";

    }

    @RequestMapping(value = "/tjxi", method = RequestMethod.GET)
    public String sfh(@RequestParam("ddid") String ddid, HttpServletRequest request) {
        System.out.println("查看处理" + ddid);

        prep prep = prepMapper.getxx(ddid);

        request.setAttribute("prep", prep);


        return "member/prep/info";

    }

    @RequestMapping(value = "/charts", method = RequestMethod.GET)

    public String charts() {


        return "admin/affiche/index";

    }

    @RequestMapping(value = "/chart", method = RequestMethod.GET)
    @ResponseBody
    public LinkedHashMap<String, ArrayList<prep>> chart() {

        ArrayList<prep> preps = prepMapper.gettotal();
        ArrayList<prep> preps1 = prepMapper.gettotal1();

        LinkedHashMap<String, ArrayList<prep>> map = new LinkedHashMap<>();
        map.put("list1",preps);
        map.put("list2",preps1);
        System.out.println("返回");
        return map;

    }

    @RequestMapping(value = "/upcourt", method = RequestMethod.POST)
    public String upcourt(sale sale, @RequestParam("pic") MultipartFile uploadFile, HttpServletRequest request) {

        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        System.out.println("添加场地" + sale.getTitle());
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");

        String uploadRootPath = request.getServletContext().getRealPath(
                "images");
        System.out.println("文件" + uploadRootPath);


//        String filrPath = "G:\\Proimg";
        String filrPath = request.getServletContext().getRealPath("images");
        String netPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        File fileDir = new File(filrPath);
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }

        String fileName = uploadFile.getOriginalFilename();
        String suffix = fileName.substring(fileName.indexOf("."));
        String newFileName = "IMG_" + new Random().nextInt(100) + "_" + format.format(date) + suffix;

        File file = new File(filrPath, newFileName);


        try {
            uploadFile.transferTo(file);
            String filePath = netPath + "/images/" + newFileName;
            sale.setUrl(filePath);
            sale.setAddtime(format1.format(date));
            sale.setDj(1);

        } catch (IOException e) {
            e.printStackTrace();
        }

        request.setAttribute("message", hzpservice.upcourt(sale));




        return "admin/hzp/add";

    }


    @RequestMapping(value = "/jk", method = RequestMethod.GET)

    public String jk() {


        return "admin/hzp/jiankong";

    }
}
