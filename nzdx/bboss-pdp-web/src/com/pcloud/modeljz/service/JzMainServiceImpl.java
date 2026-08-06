
package com.pcloud.modeljz.service;

import com.common.*;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.orm.transaction.TransactionManager;
import com.frameworkset.util.ListInfo;
import com.frameworkset.util.StringUtil;
import com.pcloud.modeljz.entity.*;
import com.pcloud.modelrun.service.ModelRunException;
import com.pcloud.modelrun.service.ModelRunService;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.frameworkset.platform.security.AccessControl;
import org.frameworkset.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.sql.SQLException;
import java.util.*;

public class JzMainServiceImpl implements JzMainService {
    private ModelRunService modelRunService;
    //模型相关目录
    public static String jzRunDir = PropertiesUtils.readKeyValue("model.properties", "jzRunDir");
    public static String aggFileDir = PropertiesUtils.readKeyValue("model.properties", "inFile");
    public static String SRDIR= PropertiesUtils.readKeyValue("model.properties", "SRDIR");
    private static Logger log = LoggerFactory.getLogger(com.pcloud.modeljz.service.JzMainServiceImpl.class);

    private ConfigSQLExecutor executor;

    public void addJzMain(JzMain jzMain) throws JzMainException {
        // 业务组件
        try {
            jzMain.setCreatDate(DateUtils.getLongDateStr());
            jzMain.setCreater(AccessControl.getAccessControl().getUserID());
            jzMain.setLastModifyDate(DateUtils.getLongDateStr());
            executor.insertBean("addJzMain", jzMain);
        } catch (Throwable e) {
            throw new JzMainException("add JzMain failed:", e);
        }

    }

    public void deleteJzMain(String jzId) throws JzMainException {
        try {
            executor.delete("deleteByKey", jzId);
        } catch (Throwable e) {
            throw new JzMainException("delete JzMain failed::jzId=" + jzId, e);
        }

    }

    public void deleteBatchJzMain(String... jzIds) throws JzMainException {
        TransactionManager tm = new TransactionManager();
        try {
            tm.begin();
            executor.deleteByKeys("deleteByKey", jzIds);
            tm.commit();
        } catch (Throwable e) {

            throw new JzMainException("batch delete JzMain failed::jzIds=" + jzIds, e);
        } finally {
            tm.release();
        }

    }

    public void updateJzMain(JzMain jzMain) throws JzMainException {
        try {
            jzMain.setLastModifyDate(DateUtils.getLongDateStr());
            executor.updateBean("updateJzMain", jzMain);
        } catch (Throwable e) {
            throw new JzMainException("update JzMain failed::", e);
        }

    }

    public JzMain getJzMain(String jzId) throws JzMainException {
        try {
            JzMain bean = executor.queryObject(JzMain.class, "selectById", jzId);
            return bean;
        } catch (Throwable e) {
            throw new JzMainException("get JzMain failed::jzId=" + jzId, e);
        }

    }

    public ListInfo queryListInfoJzMains(JzMainCondition conditions, long offset, int pagesize) throws JzMainException {
        ListInfo datas = null;
        try {
            datas = executor.queryListInfoBean(JzMain.class, "queryListJzMain", offset, pagesize, conditions);
        } catch (Exception e) {
            throw new JzMainException("pagine query JzMain failed:", e);
        }
        return datas;

    }

    public List<JzMain> queryListJzMains(JzMainCondition conditions) throws JzMainException {
        try {
            List<JzMain> beans = executor.queryListBean(JzMain.class, "queryListJzMain", conditions);
            return beans;
        } catch (Exception e) {
            throw new JzMainException("query JzMain failed:", e);
        }

    }

    @Override
    public List<JzDf> queryListJzDf(int type, String mdid) throws JzMainException {
        try {
            List<JzDf> beans = executor.queryList(JzDf.class, "queryListJzDf", type, mdid);
            return beans;
        } catch (Exception e) {
            throw new JzMainException("query JzMain failed:", e);
        }

    }

    @Override
    public void updateJzDf(JzDf jzDf) throws JzMainException {
        try {
            executor.updateBean("updateJzDf", jzDf);
        } catch (Throwable e) {
            throw new JzMainException("update jzDf failed::", e);
        }
    }

    @Override
    public List<JzBasic> queryListJzBasic(int type) {
        try {
            List<JzBasic> beans = executor.queryList(JzBasic.class, "queryListJzBasic", type);
            return beans;
        } catch (Exception e) {
            throw new JzMainException("query queryListJzBasic failed:", e);
        }
    }

    @Override
    public List<JzDf> queryListJzDf() {
        try {
            List<JzDf> beans = executor.queryList(JzDf.class, "queryListJzBasic");
            return beans;
        } catch (Exception e) {
            throw new JzMainException("query queryListJzDf failed:", e);
        }
    }

    @Override
    public void executeJZ() throws JzMainException {


    }


    @Override
    public List<JzAreaIndus> queryListJzAreaIndus(int type, String mdid) throws JzMainException {
        try {
            List<JzAreaIndus> beans = executor.queryList(JzAreaIndus.class, "queryListJzAreaIndus", type, mdid);
            return beans;
        } catch (Exception e) {
            throw new JzMainException("query JzMain failed:", e);
        }

    }

    /**
     *根据操作ID组装CMD参数文件
     * @param mdid
     * @throws JzMainException
     */
    public void crateInputText(String mdid) throws JzMainException {
        String areaStr = "";
        String indusStr = "";
        String areaDFstr = "";
        String indusDFstr = "";
        try {
            List<JzAreaIndus> areaList = executor.queryList(JzAreaIndus.class, "queryListJzAreaIndus", 0, mdid);
            List<JzAreaIndus> indusList = executor.queryList(JzAreaIndus.class, "queryListJzAreaIndus", 1, mdid);
            List<JzDf> areaDfList = executor.queryList(JzDf.class, "queryListJzDf", 0, mdid);
            List<JzDf> indusDfList = executor.queryList(JzDf.class, "queryListJzDf", 1, mdid);

            for (int i = 0; i < areaDfList.size(); i++) {
                JzDf aDF = areaDfList.get(i);
                areaDFstr += aDF.getDfTitle() + "! " + aDF.getRemark() + "\n";
            }

            for (int i = 0; i < indusDfList.size(); i++) {
                JzDf indusDF = indusDfList.get(i);
                indusDFstr += indusDF.getDfTitle() + "! " + indusDF.getRemark() + "\n";
            }

            for (int i = 0; i < areaList.size(); i++) {
                JzAreaIndus abean = areaList.get(i);
                areaStr += (StringUtil.isEmpty(abean.getAiBlongNew()) ? abean.getAiBlongBefore() : abean.getAiBlongNew()) + "! " + abean.getAiBlongBefore() + "\t" + abean.getAiName() + "\n";
            }

            for (int n = 0; n < indusList.size(); n++) {
                JzAreaIndus ibean = indusList.get(n);
                indusStr += (StringUtil.isEmpty(ibean.getAiBlongNew()) ? ibean.getAiBlongBefore() : ibean.getAiBlongNew()) + "! " + ibean.getAiBlongBefore() + "\t" + ibean.getAiName() + "\n";
            }
            //读取基础文件
            BufferedReader br = new BufferedReader(new FileReader(new File(aggFileDir + "Agg_Stand.txt")));//
            StringBuffer sb = new StringBuffer();
            String str = null;
            while ((str = br.readLine()) != null) {//一行一行读，如果不为空，继续运行
                if (str.indexOf("{area_df_num}") != -1) {
                    str = str.replace("{area_df_num}", String.valueOf(areaDfList.size()));
                } else if (str.indexOf("{area_df}") != -1) {
                    str = str.replace("{area_df}", areaDFstr);
                } else if (str.indexOf("{area_aggs}") != -1) {
                    str = str.replace("{area_aggs}", areaStr);
                } else if (str.indexOf("{indus_df_num}") != -1) {
                    str = str.replace("{indus_df_num}", String.valueOf(indusDfList.size()));
                } else if (str.indexOf("{indus_df}") != -1) {
                    str = str.replace("{indus_df}", indusDFstr);
                } else if (str.indexOf("{indus_aggs}") != -1) {
                    str = str.replace("{indus_aggs}", indusStr);
                }
                sb.append(str + "\n");
            }
            sb.setLength(sb.length() - 1);//因为多加了一个换行符，所以截掉
            br.close();//关闭输入流
            //写入
            String newFileName = AccessControl.getAccessControl().getUserAccount() + "-" + mdid + ".txt";
            PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(aggFileDir + newFileName)));
            out.write(sb.toString());//把sb里面的内容读入E:test.txt中
            out.flush();
            out.close();
        } catch (Exception e) {
            throw new JzMainException("query JzMain failed:", e);
        }
    }

    /**
     * 根据文件名称执行CMD操作
     * @param inputTxtName
     * @return
     * @throws JzMainException
     */
    public Map<String, String> executeCMD(String rundir, String command, String inputTxtName) throws JzMainException {
        Map<String, String> result = new HashMap<String, String>();
        try {
            //执行目录 runDir 输出目录参照output 下的<my_agg>；
            File dir = new File(rundir);
            //cmd 操作语句
            Runtime r = Runtime.getRuntime();
            Process p = r.exec(command + inputTxtName, null, dir);
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream(), "GBK"));
            StringBuffer sb = new StringBuffer();
            String inline;
            while (null != (inline = br.readLine())) {
                sb.append(inline).append("\r\n");
            }
            System.out.println(sb.toString());
            int exitVal = p.waitFor();
            System.out.println("Exited with error code " + exitVal);
            p.destroy();
            result.put("execVal", String.valueOf(exitVal));
            result.put("execLog", sb.toString());
            return result;
        } catch (Exception e) {
            throw new JzMainException("execute JZ CMD failed:", e);
        }
    }

    @Override
    public void addJzDf(JzDf jzDf) {
        try {
            jzDf.setCreatDate(DateUtils.getLongDateStr());
            jzDf.setCreater(AccessControl.getAccessControl().getUserID());
            executor.insertBean("addjzDf", jzDf);
        } catch (Throwable e) {
            throw new JzMainException("add JzDF failed:", e);
        }

    }

    public JzDf getJzDfById(String id) {
        try {
            JzDf bean = executor.queryObject(JzDf.class, "selectJzDfById", id);
            return bean;
        } catch (Throwable e) {
            throw new JzMainException("query JzDF failed:", e);
        }
    }


    public void deleteJzDfById(String id) throws JzMainException {
        try {
            executor.delete("deleteJzDfByKey", id);
        } catch (Throwable e) {
            throw new JzMainException("delete JzDf failed::jzId=" + id, e);
        }

    }

    @Override
    public List<String> getYearMouth() {
        try {
            List<String> jzList = executor.queryList(String.class, "getYearMouth", AccessControl.getAccessControl().getUserID());
            return jzList;
        } catch (SQLException e) {
            throw new ModelRunException("query queryJZList failed:", e);
        }
    }

    @Override
    public List<JzMain> querySymbJzMain() {

        try {
            List<JzMain> SymbJzMainList = executor.queryList(JzMain.class, "querySymbJzMain");
            return SymbJzMainList;
        } catch (SQLException e) {
            throw new ModelRunException("query SymbJzMainList failed:", e);
        }
    }

    @Override
    public List<JzDf> getSymbJzDf(String miId, String type) {
        try {
            List<JzDf> dflistAorI = executor.queryList(JzDf.class, "getSymbJzDf", miId, type);
            return dflistAorI;
        } catch (SQLException e) {
            throw new ModelRunException("query SymbJzMainList failed:", e);
        }
    }

    @Override
    public List<JzAreaIndus> getSymbJz(String miId, String type) {
        try {
            List<JzAreaIndus> dflistAorI = executor.queryList(JzAreaIndus.class, "getSymbJz", miId, type);
            return dflistAorI;
        } catch (SQLException e) {
            throw new ModelRunException("query SymbJzMainList failed:", e);
        }
    }

    @Override
    public void deleteJzdfByMdId(String miId, String type) {
        try {
            executor.delete("deleteJzdfByMdId", miId,type);
        } catch (Throwable e) {
            throw new JzMainException("delete JzdfByMdId failed::jzId=" + miId+"&"+type, e);
        }
    }

    @Override
    public void deleteJzdfByMdIdOnly(String miId) {
        try {
            executor.delete("deleteJzdfByMdIdOnly");
        } catch (Throwable e) {
            throw new JzMainException("delete deleteJzdfByMdIdOnly failed::jzId=" + miId, e);
        }
    }

    @Override
    public void deleteJzDetailByMdId(String miId, String type) {
        try {
            executor.delete("deleteJzDetailByMdId",  miId,type);
        } catch (Throwable e) {
            throw new JzMainException("delete JzDetailByMdId failed::jzId=" + miId+"&"+type, e);
        }
    }

    @Override
    public void batchAddJzDf(List<JzDf> list) {
        try {
            executor.insertBeans("batchAddJzDf",list);
        }catch (SQLException e) {
            throw new JzMainException("Batch  add JzAreaIndus failed:", e);
        }
    }

    @Override
    public void addJzAreaIndus(List<JzAreaIndus> list) throws JzMainException {
        try {
            executor.insertBeans("addAreaIndus", list);
        } catch (SQLException e) {
            throw new JzMainException("Batch  add JzAreaIndus failed:", e);
        }
    }

    @Override
    public List<Mshorck> queryListMshorck() throws JzMainException {
        try {
            List<Mshorck> shorckList = executor.queryList(Mshorck.class, "queryListShorck");
            return shorckList;
        } catch (SQLException e) {
            throw new JzMainException("Batch  add JzAreaIndus failed:", e);
        }

    }

    public void creatCMF(String colsure, String shorck) {
        String dir = "E:\\Users\\Administrator\\Desktop\\pcloud\\1.Version 2\\2.shock\\txt1_ModeSet.txt";
        try {
            //读取基础文件
            BufferedReader br = new BufferedReader(new FileReader(new File(dir)));
            StringBuffer sb = new StringBuffer();
            String str = null;
            while ((str = br.readLine()) != null) {//一行一行读，如果不为空，继续运行
                sb.append(str + "\n");
            }
            sb.append(colsure);
            sb.append(shorck);
            br.close();//关闭输入流
            //写入
//			String newFileName = AccessControl.getAccessControl().getUserID()+"_"+mdid+".cmf";
            String newFileName = "E:\\Users\\Administrator\\Desktop\\pcloud\\1.Version 2\\2.shock\\test2.cmf";
            PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(newFileName)));
            out.write(sb.toString());//把sb里面的内容读入test.cmf中
            out.flush();
            out.close();
        } catch (Throwable e) {
            throw new JzMainException("add JzMain failed:", e);
        }
    }

    @Override
    public List<JzDf> queryListJzDfAll(String mdid) throws JzMainException {
        try {
            List<JzDf> beans = executor.queryList(JzDf.class, "queryListJzDfAll", mdid);
            return beans;
        } catch (Exception e) {
            throw new JzMainException("query JzMain failed:", e);
        }

    }

    @Override
    public List<JzAreaIndus> queryListJzAreaIndusAll(String mdid) throws JzMainException {
        try {
            List<JzAreaIndus> beans = executor.queryList(JzAreaIndus.class, "queryListJzAreaIndusAll", mdid);
            return beans;
        } catch (Exception e) {
            throw new JzMainException("query JzMain failed:", e);
        }

    }

    @Override
    public void deleteModelRun(String mdId) throws JzMainException {
        try {
            executor.delete("deleteModelRun", mdId);
        } catch (Throwable e) {
            throw new JzMainException("delete modelRun failed::mdId=" + mdId, e);
        }
    }

    @Override
    public int checkJzName(String name) {
        try {
            List<JzMain> list  = executor.queryList(JzMain.class, "checkJzName",AccessControl.getAccessControl().getUserID(), name);
            return  list.size()>0?list.size():0;
        } catch (Throwable e) {
            throw new JzMainException("checkJzName failed::mdId=" + name, e);
        }
    }

    @Override
    public JzMain getJzMainByMdId(String mdId) throws JzMainException {
        try {
            JzMain bean = executor.queryObject(JzMain.class, "selectBymdId", mdId);
            return bean;
        } catch (Throwable e) {
            throw new JzMainException("get JzMain failed::mdId=" + mdId, e);
        }

    }

    @Override
    public void addAggExcel(MultipartFile file) throws Exception {

        String  useraccount  = AccessControl.getAccessControl().getUserAccount();
        boolean role1 = UserUtils.isHasRole("globalmodel");
        boolean role2 = UserUtils.isHasRole("usersfree");
        boolean role3 = UserUtils.isHasRole("trialglobalmodel");

        List<List<Object>> sheet0  = new ExceImportlUtil().getBankListByExcel(file,0,1);
        List<List<Object>> sheet1  = new ExceImportlUtil().getBankListByExcel(file,1,5);
        List<List<Object>> sheet2  = new ExceImportlUtil().getBankListByExcel(file,2,5);
        List<List<Object>> sheet3  = new ExceImportlUtil().getBankListByExcel(file,3,5);
        List<List<Object>> sheet4  = new ExceImportlUtil().getBankListByExcel(file,4,5);

        String  mdId = UUID.randomUUID().toString();

        JzMain jzMain = getObjToJzMain(sheet0,mdId);
        List<JzDf> jzdfList = getObjToJzDf(sheet1,sheet2,mdId);

        if(role1) {
            if(jzdfList.size() > 100) {
                throw new Exception("区域分类和行业分类数量一共不能超过100个!");
            }
        }else if(role3) {
            if(jzdfList.size() > 100) {
                throw new Exception("区域分类和行业分类数量一共不能超过100个!");
            }
        }else if(role2) {
            if(jzdfList.size() > 10) {
                throw new Exception("免费用户区域分类和行业分类数量一共不能超过10个!");
            }
         }



        List<JzAreaIndus> jzAreaIndusList = getObjToJzAreaIndus(sheet3,sheet4,mdId);

        addJzMain(jzMain);
        batchAddJzDf(jzdfList);
        addJzAreaIndus(jzAreaIndusList);

        //执行加总操作1、生成参数输入文件 2、执行CMD 操作
        crateInputText(jzMain.getMdId());
        String inputTxtName = useraccount+"-"+jzMain.getMdId();
        Map<String,String> aggRes = CMDUtils.executeCMD(jzRunDir,"cmd /c data-agg ",inputTxtName);
        if (aggRes.get("execVal").equals("0")){//CMD 操作执行成功，更新结果文件所在目录
            jzMain.setOutputDir(SRDIR+inputTxtName);
            jzMain.setAggLog(aggRes.get("execLog"));
            jzMain.setJzStatus("1");
            CMDUtils.executeWithoutRs(SRDIR+inputTxtName+File.separator,"cmd /c CreateCSV ","");
        }else{
            jzMain.setJzStatus("9");
            jzMain.setAggLog(aggRes.get("execLog"));
        }
        updateJzMain(jzMain);


    }

    @Override
    public Map<String, Object>  addCaseExcel(MultipartFile file)  throws Exception {


        String  useraccount  = AccessControl.getAccessControl().getUserAccount();

        List<List<Object>> sheet0  = new ExceImportlUtil().getBankListByExcel(file,0,1);
        List<List<Object>> sheet1  = new ExceImportlUtil().getBankListByExcel(file,1,5);
        List<List<Object>> sheet2  = new ExceImportlUtil().getBankListByExcel(file,2,5);
        List<List<Object>> sheet3  = new ExceImportlUtil().getBankListByExcel(file,3,5);
        List<List<Object>> sheet4  = new ExceImportlUtil().getBankListByExcel(file,4,5);
        List<List<Object>> sheet5  = new ExceImportlUtil().getBankListByExcel(file,5,1);
        List<List<Object>> sheet6  = new ExceImportlUtil().getBankListByExcel(file,6,1);

        String  mdId = UUID.randomUUID().toString();

        JzMain jzMain = getObjToJzMain(sheet0,mdId);
        List<JzDf> jzdfList = getObjToJzDf(sheet1,sheet2,mdId);
        List<JzAreaIndus> jzAreaIndusList = getObjToJzAreaIndus(sheet3,sheet4,mdId);

        addJzMain(jzMain);
        batchAddJzDf(jzdfList);
        addJzAreaIndus(jzAreaIndusList);

        //执行加总操作1、生成参数输入文件 2、执行CMD 操作
        crateInputText(jzMain.getMdId());
        String inputTxtName = useraccount+"-"+jzMain.getMdId();
        Map<String,String> aggRes = CMDUtils.executeCMD(jzRunDir,"cmd /c data-agg ",inputTxtName);
        if (aggRes.get("execVal").equals("0")){//CMD 操作执行成功，更新结果文件所在目录
            jzMain.setOutputDir(SRDIR+inputTxtName);
            jzMain.setAggLog(aggRes.get("execLog"));
            jzMain.setJzStatus("1");
            CMDUtils.executeWithoutRs(SRDIR+inputTxtName+File.separator,"cmd /c CreateCSV ","");
        }else{
            jzMain.setJzStatus("9");
            jzMain.setAggLog(aggRes.get("execLog"));
        }
        updateJzMain(jzMain);

        String colsure = String.valueOf(sheet5.get(1).get(1));
        String colsureType = String.valueOf(sheet5.get(0).get(1));
        String shorck = String.valueOf(sheet6.get(0).get(1));

        if("标准闭合".equals(colsureType)) {
            colsureType = "BookClosure";
        }else if("短期闭合".equals(colsureType)) {
            colsureType = "ShortClosure";
        }else {
            colsureType = "SelfClosure";
        }
       /* // 合并生成cmf文件
        ModelRun modelrun = modelRunService.creatCMF(SRDIR,jzMain.getJzId(),colsure,shorck,jzMain.getJzTitle(),null,colsureType);

        // 合并生成bat文件并执行
        modelRunService.creatRunBat(modelrun,SRDIR);
        // 执行bat文件
        String rs = CMDUtils.executeWithoutRs(SRDIR+modelrun.getCreateUsern()+ "-" + modelrun.getJzId()+File.separator, "cmd /c " + modelrun.getRunId() + " ", "");
        if("1".equals(rs)) {//CMD 操作执行成功，更新结果文件所在目录
            modelrun.setRunStatus("1");
        } else {
            modelrun.setRunStatus("9");
        }
        modelRunService.updateModelRun(modelrun);*/

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("flag", "success");
        data.put("colsure", colsure);
        data.put("mdId", mdId);
        data.put("colsureType", colsureType);
        data.put("shorck", shorck);

        return data;

    }


    @Override
    public XSSFWorkbook expAggExcel(String jzId) throws Exception {
        return null;
    }

    public JzMain  getObjToJzMain(List<List<Object>> listob, String mdId) {

            JzMain jzMain = new JzMain();

            String  id = UUID.randomUUID().toString();
            String  useraccount  = AccessControl.getAccessControl().getUserAccount();
            jzMain.setJzId(id);
            jzMain.setMdId(mdId);
            jzMain.setJzType("0");
            jzMain.setJzTitle(String.valueOf(listob.get(0).get(1)));
            jzMain.setRemark(String.valueOf(listob.get(1).get(1)));
            jzMain.setCreaterUsern(useraccount);

           // System.out.println("打印信息-->"+jzMain.toString());

        return jzMain;
    }

    public List<JzDf> getObjToJzDf(List<List<Object>> sheet1, List<List<Object>> sheet2,String mdId) {

        List<JzDf> allDflist = new ArrayList<JzDf>();

        String creatDate = DateUtils.getLongDateStr();
        String Creater = AccessControl.getAccessControl().getUserID();

        for (int i = 0; i < sheet1.size(); i++) {
                JzDf bean = new JzDf();
                List<Object> lo = sheet1.get(i);

                if(lo.size() > 0){
                    bean.setMdId(mdId);
                    bean.setDfId(UUID.randomUUID().toString());
                    bean.setDfType("1");
                    bean.setCreatDate(creatDate);
                    bean.setCreater(Creater);
                    bean.setDfTitle(String.valueOf(lo.get(0)));
                    bean.setRemark(String.valueOf(lo.get(1)));
                    bean.setSortNo(String.valueOf(lo.get(2)));
                    bean.setDfCode(String.valueOf(lo.get(2)));
                    allDflist.add(bean);
            }


        }

        for (int i = 0; i < sheet2.size(); i++) {
            JzDf bean = new JzDf();
            List<Object> lo = sheet2.get(i);
            if(lo.size() > 0){
            bean.setMdId(mdId);
            bean.setDfId(UUID.randomUUID().toString());
            bean.setDfType("0");
            bean.setCreatDate(creatDate);
            bean.setCreater(Creater);

            bean.setDfTitle(String.valueOf(lo.get(0)));
            bean.setRemark(String.valueOf(lo.get(1)));
            bean.setSortNo(String.valueOf(lo.get(2)));
            bean.setDfCode(String.valueOf(lo.get(2)));

            allDflist.add(bean);

            }

        }

            return allDflist;

    }

    public List<JzAreaIndus> getObjToJzAreaIndus(List<List<Object>> sheet3, List<List<Object>> sheet4,String mdId) {

        List<JzAreaIndus> allJzAreaIndus = new ArrayList<JzAreaIndus>();

        String creatDate = DateUtils.getLongDateStr();
        String Creater = AccessControl.getAccessControl().getUserID();

        for (int i = 0; i < sheet3.size(); i++) {

            JzAreaIndus bean = new JzAreaIndus();
            List<Object> lo = sheet3.get(i);
            if(lo.size() > 0) {
                bean.setMdId(mdId);
                bean.setAiId(UUID.randomUUID().toString());

                bean.setCreateDate(creatDate);
                bean.setLastModifyDate(creatDate);
                bean.setCreater(Creater);

                bean.setAiBlongNew(String.valueOf(lo.get(0)));
                bean.setAiBlongBefore(String.valueOf(lo.get(1)));
                bean.setAiName(String.valueOf(lo.get(2)));
                bean.setAiType("1");
                bean.setSortNo(String.valueOf(lo.get(4)));
                bean.setAiCode(String.valueOf(lo.get(4)));
                bean.setAiRemark(lo.size()>5?String.valueOf(lo.get(5)):"");

                allJzAreaIndus.add(bean);
            }

        }

        for (int i = 0; i < sheet4.size(); i++) {

            JzAreaIndus bean = new JzAreaIndus();
            List<Object> lo = sheet4.get(i);
            if(lo.size() > 0) {
                bean.setMdId(mdId);
                bean.setAiId(UUID.randomUUID().toString());

                bean.setCreateDate(creatDate);
                bean.setLastModifyDate(creatDate);
                bean.setCreater(Creater);

                bean.setAiBlongNew(String.valueOf(lo.get(0)));
                bean.setAiBlongBefore(String.valueOf(lo.get(1)));
                bean.setAiName(String.valueOf(lo.get(2)));
                bean.setAiType("0");
                bean.setSortNo(String.valueOf(lo.get(4)));
                bean.setAiCode(String.valueOf(lo.get(4)));
                bean.setAiRemark(String.valueOf(lo.get(5)));

                allJzAreaIndus.add(bean);
            }

        }
        return allJzAreaIndus;
    }

    @Override
    public void updateJzTitle(JzMain jzMain) throws Exception {
        try {
            executor.updateBean("updateJzTitle", jzMain);
        } catch (Throwable e) {
            throw new Exception("update jzMain failed::", e);
        }
    }
}