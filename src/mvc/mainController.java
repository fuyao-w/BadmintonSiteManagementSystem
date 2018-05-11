package mvc;

import bean.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import mapper.commentMapper;
import mapper.memberMapper;
import mapper.pmemberMapper;
import mapper.saleMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

@Controller
@RequestMapping("/")
@Scope("session")
public class mainController implements Serializable{
@Autowired
 memberMapper memberMapper;
@Autowired
 pmemberMapper pmemberMapper;
@Autowired
saleMapper saleMapper;
@Autowired
commentMapper commentMapper;
 private static ReentrantLock lock = new ReentrantLock();

 private static Condition condition = lock.newCondition();



 @RequestMapping(value = "/reg", method = RequestMethod.POST)
 public String reg(member member, HttpServletRequest request){
  member.setLasttime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
  member.setLastip("127.0.0.1");
  member.setIfuse(1);
  member.setType("pserson");

  member.setRegtime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
memberMapper.insert(member);
  request.setAttribute("message","注册成功");
  request.setAttribute("username",member.getUsername());
  request.setAttribute("password",member.getPassword());

  return "personreg";
 }
 @RequestMapping(value = "/inpmem", method = RequestMethod.POST)
 public String inpmem(pmember pmember, HttpServletRequest request,HttpServletResponse response){
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
  System.out.println(pmember.getRealname());
  request.setAttribute("message","成功");
 pmemberMapper.insert(pmember);
  return "login";
 }

 @RequestMapping(value = "/findpw", method = RequestMethod.POST)
 public String findpw(HttpServletRequest request){

  String username = request.getParameter("username");

  memberMapper.upnpw(username);
request.setAttribute("message","新密码为:111111");
  return "login";
 }
 @RequestMapping(value = "/comment", method = RequestMethod.POST)
 @ResponseBody
 public HashMap<String,Object> comments(@RequestParam("comments") String comments,@RequestParam("id")Integer id,
                                         @RequestParam("username")String username ,HttpServletResponse response)throws
 UnsupportedEncodingException
 {

response.setCharacterEncoding("utf-8");
   System.out.println("评论:"+ new String(comments.getBytes("iso-8859-1"),"utf-8"));
String com = new String(comments.getBytes("iso-8859-1"),"utf-8");
  System.out.println("评论者:"+username+" "+"场地:"+id);
  HashMap<String,Object> hashMap = new HashMap<>();

if (saleMapper.selqualification(id,username) == 0){
 hashMap.put("news","对不起，您没有在该场地已完成的订单不能评论!");
}
else {
 comment comment = new comment();
 comment.setTimes(new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()));
 comment.setContent(com);
 comment.setsId(id);
 comment.setUsername(username);
 commentMapper.insert(comment);
 hashMap.put("news","评论成功!");
 hashMap.put("mes", com);
 hashMap.put("time", comment.getTimes());
 hashMap.put("state",100);

}




  return hashMap;
 }

 @RequestMapping(value = "/hinf", method = RequestMethod.GET)
 public ModelAndView hinf(int id,HttpServletRequest request) {
  System.out.println("单页" + id);

  sale sale = saleMapper.selByID(id);

  comment Comment = commentMapper.selcom();
  request.setAttribute("comment",Comment);

  return new ModelAndView("hinfo", "sale", sale);

 }

 @RequestMapping(value = "/review", method = RequestMethod.GET)
 @ResponseBody
 public  PageInfo<comment> review(@RequestParam("curPage") int curPage) {
  System.out.println("查看评论"+curPage);
  int pagesize = 5;
  PageHelper.startPage(curPage, pagesize);
ArrayList<comment> comments= commentMapper.selreview();
  PageInfo<comment> pageInfo = new PageInfo<>(comments);


  return pageInfo;

 }

 @RequestMapping(value = "/delrev", method = RequestMethod.GET)

 public  String delrev(@RequestParam("id") int id) {

  commentMapper.del(id);
  System.out.println("删除");
  return "admin/prep/review";

 }





}
