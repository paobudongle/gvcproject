package com.pcloud.registeruser.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.common.*;
import com.frameworkset.platform.admin.service.SmUserService;
import com.pcloud.registeruser.entity.RUser;
import com.pcloud.registeruser.entity.Step;
import org.apache.log4j.Logger;
import org.frameworkset.platform.security.AccessControl;
import org.frameworkset.util.DigestUtils;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class RegisterUserController {

    private static Logger log = org.apache.log4j.Logger.getLogger(RegisterUserController.class);

    private SmUserService smUserService;

    public static String appid = PropertiesUtils.readKeyValue("config.properties", "APPID");
    public static String secret = PropertiesUtils.readKeyValue("config.properties", "SECRET");
    public static String ilaburl= PropertiesUtils.readKeyValue("config.properties", "ilabUrl");
    public  static  Map<String,String>  token_map = new HashMap<String,String>();
    public @ResponseBody
    Map<String,Object> registerUser(HttpServletRequest request) {
        // 控制器

        int code = -99;
        String msg = "注册失败";
        int $uid = -98;


        Map<String, Object> map = new HashMap<String,Object>();
        try {
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String userMobiletel1 = request.getParameter("userMobiletel1");
            String remark1 = request.getParameter("remark1");

            if(userName.contains("admin")) {
                code = -1;
                msg = "用户名包含不允许注册的词语";
                map.put("code",code);
                map.put("msg",msg);
                return map;
            }


            RUser smUser = new RUser();
            String uid = DateUtils.currentTime();
            smUser.setUserId(uid); //论坛用户ID
            smUser.setUserRealname(userName);
            smUser.setUserName(userName);
            smUser.setUserPassword(password);
            smUser.setUserEmail(email);
            smUser.setUserIsvalid(2);
            smUser.setUserType("0");
            smUser.setPasswordDualtime(-1);
            smUser.setUserMobiletel1(userMobiletel1);
            smUser.setRemark1(remark1);
            String depart = PropertiesUtils.readKeyValue("pay.properties", "depart");
            String role = PropertiesUtils.readKeyValue("pay.properties", "role");
            smUser.setDepartId(depart);
            smUserService.addSmUser(smUser); //添加用户
            smUserService.saveUserRoles(uid,role); //添加角色
            code = 1;
            msg = userName+",注册成功";
        } catch (Exception e) {
            log.error("add UserRole failed:", e);
        }

        map.put("code",code);
        map.put("msg",msg);
        return map;

    }

    @ResponseBody
    public void loginToken(String token,String ticket, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws  Exception {
        System.out.println("==============loginToken==========");
        Map userMap = new HashMap();
        try {
            try{
                String newstr= DigestUtils.md5DigestAsHex((ticket+appid+secret).getBytes());
                String ul = ilaburl+"/open/api/v2/token?ticket="+URLEncoder.encode(ticket,"utf-8")+"&appid="+appid+"&signature="+URLEncoder.encode(newstr.toUpperCase(),"utf-8");
                System.out.println(ul);
                String  res  = HttpClinet.sendGetRequest(ul);
                userMap = JSON.parseObject(toUTF8(res), Map.class);
                System.out.println("acces_token:"+toUTF8(res));
                token_map.put(userMap.get("un").toString(),userMap.get("access_token").toString());
//                toTokenRecord(URLEncoder.encode(userMap.get("access_token").toString(),"utf-8"),userMap.get("create_time_display").toString());
            }catch (Exception d0){
                AccessControl.getInstance().login(request, response, "gc", "123456");
                response.sendRedirect("/");
                return;
            }
            String successRedirect = "/index/index.page";
            String un = userMap.get("un").toString();
            String dis = userMap.get("dis").toString();
            String password = "_@123456!"; //id+un+ "16jmp2";

            boolean exist = smUserService.checkuserexist(un);
            if(!exist){
                String uid = DateUtils.currentTime();
                RUser smUser = new RUser();
                smUser.setUserId( DateUtils.currentTime()); //实验空间用户ID，全平台唯一。
                smUser.setUserRealname(dis);
                smUser.setUserName(un);
                smUser.setUserPassword(password);
                smUser.setUserIsvalid(2);
                smUser.setUserType("0");
                smUser.setPasswordDualtime(-1);
                String depart = PropertiesUtils.readKeyValue("pay.properties", "depart");
                String role = PropertiesUtils.readKeyValue("pay.properties", "role");
                smUser.setDepartId(depart);
                smUserService.addSmUser(smUser); //添加用户
                smUserService.saveUserRoles(uid,role); //添加角色
                AccessControl.getInstance().login(request, response, un, password);
                response.sendRedirect(successRedirect);
            } else {
                AccessControl.getInstance().login(request, response, un, password);
                response.sendRedirect(successRedirect);
            }

        } catch (IOException e) {
            try {
                AccessControl.getInstance().login(request, response, "gc", "123456");
                response.sendRedirect("/");
                return;
            }catch (IOException e1){
            }
            e.printStackTrace();
        }

    }
    public static String toTokenRecord(String token,String tk_time) throws  Exception{
        System.out.println("============toTokenRecord===========");
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp tstart = new Timestamp(format.parse(tk_time).getTime());
        Timestamp tend = new Timestamp(new Date().getTime());
        List<Step> list = new ArrayList<Step>();
        Step step2 = new Step();
        step2.setSeq(1);
        step2.setTitle("实验操作");
        step2.setStartTime(tstart);
        step2.setEndTime(tend);
        step2.setTimeUsed((int)(tend.getTime()-tstart.getTime())/( 60* 1000));
        step2.setExpectTime(2);
        step2.setMaxScore(60);
        step2.setScore(55);
        step2.setRepeatCount(1);
        step2.setEvaluation("优秀");
        step2.setScoringModel("全球贸易均衡模型");
        step2.setRemarks("");
        list.add(step2);
        try {
            /* 实验结果同步到ilab */
            String projectTitle= "接口连通公测项目";
            String url =  ilaburl+"/open/api/v2/data_upload?access_token="+token;
            String username ="test";
            JSONObject param=new JSONObject();
            param.put("username",username);
            param.put("title",projectTitle);
            param.put("status","1");
            param.put("score","66");
            param.put("startTime",tstart);
            param.put("endTime",tend);
            param.put("timeUsed",(tend.getTime()-tstart.getTime())/( 60* 1000));
            param.put("appid",appid);
            param.put("originId",DateUtils.currentTime());
            param.put("steps",list);
            System.out.println(param.toString());
            return HttpClinet.httpPost(url,param.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return  "";
        }
    }
    /**
     * 将字符串的编码格式转换为utf-8
     *
     * @param str
     * @return Name = new
     * String(Name.getBytes("ISO-8859-1"), "utf-8");
     */
    public static String toUTF8(String str) {
        if (isEmpty(str)) {
            return "";
        }
        try {
            if (str.equals(new String(str.getBytes("GB2312"), "GB2312"))) {
                str = new String(str.getBytes("GB2312"), "utf-8");
                return str;
            }
        } catch (Exception exception) {
        }
        try {
            if (str.equals(new String(str.getBytes("ISO-8859-1"), "ISO-8859-1"))) {
                str = new String(str.getBytes("ISO-8859-1"), "utf-8");
                return str;
            }
        } catch (Exception exception1) {
        }
        try {
            if (str.equals(new String(str.getBytes("GBK"), "GBK"))) {
                str = new String(str.getBytes("GBK"), "utf-8");
                return str;
            }
        } catch (Exception exception3) {
        }
        return str;
    }


    /**
     * 判断是否为空
     *
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        // 如果字符串不为null，去除空格后值不与空字符串相等的话，证明字符串有实质性的内容
        if (str != null && !str.trim().isEmpty()) {
            return false;// 不为空
        }
        return true;// 为空
    }



}
