package org.frameworkset.platform.common;


import org.bbs.client.Client;

import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SessionMapUtil {
    private static Map<String, String> onlineUser = new HashMap<String, String>();
    public static Map<String, HttpSession> htsession = new ConcurrentHashMap<String, HttpSession>();
    private static Map<String, String> synInform = new HashMap<String, String>();

    public static void addOnlineUser(String userAccount,HttpSession session) {
        String sessionId = session.getId();
        kickFirstOper(userAccount);
        onlineUser.put(userAccount,sessionId);
        htsession.put(userAccount,session);
    }

    public static  void delOnlineUser(String userAccount) {

        if(onlineUser.containsKey(userAccount)){
            onlineUser.remove(userAccount);
            kickFirstOper(userAccount);
/*
            Client uc = new Client();
            String $ucsynlogout = uc.uc_user_synlogout();
            System.out.println("BBS退出成功"+userAccount);

            synInform.put("guest___",$ucsynlogout);*/
        }

    }

    public static boolean isHasOnlineUser(String userAccount,String sessionId) {
        boolean flag = false;
        String value = onlineUser.get(userAccount);
        if(value != null && !value.equals(sessionId)) {
            flag = true;
        }

        return flag;
    }

    public static void addSynInform(String userAccount,String str) {
        synInform.put(userAccount,str);
        //System.out.println(userAccount+"<<<addSynInform>>>"+str);

    }

    public static String getSynInform(String userAccount) {
        /*System.out.println(userAccount+"<<<getSynInform>>>11111");
        if(userAccount == null || "".equals(userAccount)) {
           userAccount  = "synuser";
            System.out.println(userAccount+"<<<getSynInform>>>222222");
        }
            System.out.println(synInform.get(userAccount)+"<<<getSynInform>>>33333");*/
            return synInform.get(userAccount) == null ? "" : synInform.get(userAccount);

    }

    //将第一个已经登录的用户踢下线调用的方法
    public static void kickFirstOper(String userAccount){

        if (onlineUser.get(userAccount) != null) {
            HttpSession ses = (HttpSession) htsession.get(userAccount);
            //不是同一台机子登录 先把前面的用户T了 然后把新用户的记录放进MAP
            htsession.remove(userAccount);
            onlineUser.remove(userAccount);
            ses.invalidate(); //把前面登录的那个操作员session销毁
        }
    }


    private String getMacAddrByIp(String ip) {
        String macAddr = null;
        try {
            Process process = Runtime.getRuntime().exec("nbtstat -a " + ip);
            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
            Pattern pattern = Pattern.compile("([A-F0-9]{2}-){5}[A-F0-9]{2}");
            Matcher matcher;
            for (String strLine = br.readLine(); strLine != null;
                 strLine = br.readLine()) {
                matcher = pattern.matcher(strLine);
                if (matcher.find()) {
                    macAddr = matcher.group();
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return macAddr;
    }

}
