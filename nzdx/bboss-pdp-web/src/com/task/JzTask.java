package com.task;

import com.common.CMDUtils;
import com.common.PropertiesUtils;
import com.frameworkset.common.poolman.DBUtil;
import com.pcloud.modeljz.entity.JzMain;
import com.pcloud.modelrun.service.ModelRunException;

import java.io.*;
import java.sql.Connection;
import java.util.Map;

public class JzTask {
    public static String JZRUNDIR = PropertiesUtils.readKeyValue("model.properties", "jzRunDir");
    public static String SRDIR = PropertiesUtils.readKeyValue("model.properties", "SRDIR");

    private boolean isZJ = true;
    private boolean isRUN = true;

    /**
     * 数据加总
     */
    public void runJZ() {
        try {
            System.out.println("===========正在执行加总操作===============");
            DBUtil dbUtil = new DBUtil();
            dbUtil.executeSelect("select * from t_jz_main where jz_status='0' order by creat_date");
            if (dbUtil.size() > 0) {
                for (int i = 0; i < dbUtil.size(); i++) {
                    String userid = dbUtil.getString(i, "CREATER");
                    String mdid = dbUtil.getString(i, "MD_ID");
                    String inputTxtName = userid + "-" + mdid;
                    Map<String, String> aggRes = CMDUtils.executeCMD(JZRUNDIR, "cmd /c data-agg ", inputTxtName);
                    String aggLog = aggRes.get("execLog");
                    if (aggRes.get("execVal").equals("0")) {//CMD 操作执行成功，更新结果文件所在目录
                        CMDUtils.executeCMD(SRDIR+inputTxtName,"cmd /c CreateCSV ","");
                        dbUtil.executeUpdate("update t_jz_main set  output_dir='" + (SRDIR + inputTxtName) + "', jz_status='1' , agg_log ='" + aggLog + "' , jz_status='1' where md_id='" + mdid + "'");
                    } else {
                        dbUtil.executeUpdate("update t_jz_main set  agg_log ='" + aggLog + "' , jz_status='9' where md_id='" + mdid + "' ");
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * 模型运行
     */
    public void runRs() {
        DBUtil dbUtil = new DBUtil();
        String mrid = "";
        try {
            System.out.println("============正在定时执行模型运行=============");
            dbUtil.executeSelect("select t.* from t_model_run t INNER JOIN t_jz_main d on t.jz_id = d.md_id and d.jz_status='1' where  t.run_status='0' ORDER BY t.creat_date");
            if (dbUtil.size() > 0) {
                isRUN = false;
                for (int i = 0; i < dbUtil.size(); i++) {
                    String jzid = dbUtil.getString(i, "JZ_ID");
                    mrid = dbUtil.getString(i, "RUN_ID");
                    String userid = dbUtil.getString(i, "CREATER");
                    String dir = SRDIR + userid + "-" + jzid+File.separator;
                    BufferedReader br = new BufferedReader(new FileReader(new File(dir+ "run_Stand.bat")));
                    StringBuffer sb = new StringBuffer();
                    String str = null;
                    while ((str = br.readLine()) != null) {//一行一行读，如果不为空，继续运行
                        if (str.indexOf("{run_result_dir}") != -1) {
                            str = str.replace("{run_result_dir}", mrid);
                        }
                        sb.append(str + "\r\n");
                    }
                    br.close();//关闭输入流
                    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(dir + mrid + ".bat")));
                    out.write(sb.toString());
                    out.flush();
                    out.close();
                    dbUtil.executeUpdate("update t_model_run set  run_status='1'  where run_id='" + mrid + "'");
                    CMDUtils.executeWithoutRs(dir, "cmd /c " + mrid + " ", "");
                }
            }
        } catch (Throwable e) {
            try {
                dbUtil.executeUpdate("update t_model_run set  run_status='9'  where run_id='" + mrid + "'");
            }catch (Throwable d){
                throw new ModelRunException("update Task failed:", d);
            }
            throw new ModelRunException("ModelRun Task failed:", e);
        }
    }
}
