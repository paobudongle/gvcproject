package com.common;


import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public class CMDUtils {
    public static Map<String,String> executeCMD(String rundir, String command, String inputTxtName)throws Exception{
        Map<String,String> result = new HashMap<String,String>();
        String flag ="0";
        //执行目录 runDir 输出目录参照output 下的<my_agg>；
        File dir = new File(rundir);
        //cmd 操作语句
        Runtime r = Runtime.getRuntime();
        Process p = r.exec(command+inputTxtName, null, dir);
        BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream(), "GBK"));
//        StringBuffer sb = new StringBuffer();
        String inline;
        while (null != (inline = br.readLine())) {
            System.out.println(inline);
            if(inline.indexOf("CTRL-C") != -1){
                p.destroy();
            }else if (inline.indexOf("FAILED") != -1){
                flag="1";
            }
        }
//        int exitVal = p.waitFor();
//        String error = p.getErrorStream().toString();
//        System.out.println("Exited with error String " + error);
        p.destroy();
        result.put("execVal",flag);
        result.put("execLog","");
        return result;
    }

    public static void main(String args[]) {
        CMDUtils.executeWithoutRs("E:\\Users\\Administrator\\Desktop\\pcloud\\Version 3\\1-e786f4c2-35ab-4e82-91d6-5e2921a69f3a\\","cmd /c   cfd4d477762b424894f0c89f1582509c","");
    }

    public static String  executeWithoutRs(String rundir, String command, String inputTxtName)throws RuntimeException {
        String result ="0";
        try{
            //执行目录
            File dir = new File(rundir);
            //cmd 操作语句
            Runtime r = Runtime.getRuntime();
            Process p = r.exec(command+inputTxtName, null, dir);
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream(), "GBK"));
//            StringBuffer sb = new StringBuffer();
            String inline;
            while (null != (inline = br.readLine())) {
                System.out.println(inline);
                if(inline.indexOf("CTRL-C") != -1){
                    p.destroy();
                }else if (inline.indexOf("SUCCESSFUL") != -1){
                    result="1";
                }
            }
            p.destroy();
            return result;
        }catch (Exception e){
            throw new RuntimeException("execute Run CMD failed:", e);
        }
    }
}
