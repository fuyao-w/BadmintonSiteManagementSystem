package mvc;

import bean.member;
import bean.pmember;
import bean.sale;
import mapper.memberMapper;
import mapper.pmemberMapper;
import mapper.saleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import util.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
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
 private static ReentrantLock lock = new ReentrantLock();

 private static Condition condition = lock.newCondition();

 static volatile comment Comment = new comment();

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
 public HashMap<String,comment> comments(@RequestParam("comment") String comment, HttpServletResponse response){


  lock.lock();



  try {
   System.out.println("评论:"+ new String(comment.getBytes("iso-8859-1"),"utf-8"));
   Comment.setMes(new String(comment.getBytes("iso-8859-1"),"utf-8"));
  } catch (UnsupportedEncodingException e) {
   e.printStackTrace();
  }
  Comment.setTime(new String(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime())));
  HashMap<String,comment> hashMap = new HashMap<>();
  hashMap.put("mes",Comment);
lock.unlock();
  return hashMap;
 }

 @RequestMapping(value = "/hinf", method = RequestMethod.GET)
 public ModelAndView hinf(int id,HttpServletRequest request) {
  System.out.println("单页" + id);

  sale sale = saleMapper.selByID(id);
  request.setAttribute("comment",Comment);

  return new ModelAndView("hinfo", "sale", sale);

 }

}
