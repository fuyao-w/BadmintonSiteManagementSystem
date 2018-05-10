package mvc;

import bean.member;
import bean.pmember;
import mapper.memberMapper;
import mapper.pmemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Controller
@RequestMapping("/")
@Scope("session")
public class mainController {
@Autowired
 memberMapper memberMapper;
@Autowired
 pmemberMapper pmemberMapper;

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

}
