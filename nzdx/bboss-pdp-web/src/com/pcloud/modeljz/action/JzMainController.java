/**
 *  Copyright 2008-2010 biaoping.yin
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package com.pcloud.modeljz.action;

import com.alibaba.fastjson.JSON;
import com.common.*;
import com.csvreader.CsvReader;
import com.frameworkset.util.ListInfo;
import com.frameworkset.util.StringUtil;
import com.pcloud.modeljz.entity.*;
import com.pcloud.modeljz.service.JzMainException;
import com.pcloud.modeljz.service.JzMainService;
import com.pcloud.modelrun.entity.ModelRun;
import com.pcloud.modelrun.entity.ModelRunCondition;
import com.pcloud.modelrun.service.ModelRunException;
import com.pcloud.modelrun.service.ModelRunService;
import org.apache.poi.ss.usermodel.Workbook;
import org.frameworkset.platform.security.AccessControl;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.multipart.MultipartFile;
import org.frameworkset.web.servlet.ModelMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.net.URLDecoder;
import java.util.*;
/**
 * <p>Title: JzMainController</p> <p>Description: 模型数据加总控制器处理类 </p> <p>北京信碧诚</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-25 00:24:45 @author liuwu @version
 * v1.0
 */
public class JzMainController {
    public static  String JZRUNDIR = PropertiesUtils.readKeyValue("model.properties", "jzRunDir");
    private static Logger log = LoggerFactory.getLogger(JzMainController.class);

    private JzMainService jzMainService;
    private ModelRunService modelRunService;
    public @ResponseBody String deleteBatchJzMain(String... jzIds) {
        try {
            jzMainService.deleteBatchJzMain(jzIds);
            return "success";
        } catch (Throwable e) {
            log.error("delete Batch jzIds failed:", e);
            return StringUtil.formatBRException(e);
        }

    }
    public @ResponseBody String updateJzMain(JzMain jzMain) {
        try {
            jzMainService.updateJzMain(jzMain);
            return "success";
        } catch (Throwable e) {
            log.error("update JzMain failed:", e);
            return StringUtil.formatBRException(e);
        }

    }
    public String getJzMain(String jzId, ModelMap model) throws JzMainException {
        try {
            JzMain jzMain = jzMainService.getJzMain(jzId);
            model.addAttribute("jzMain", jzMain);
            return "path:getJzMain";
        } catch (JzMainException e) {
            throw e;
        } catch (Throwable e) {
            throw new JzMainException("get JzMain failed::jzId=" + jzId, e);
        }

    }

    public String toJzFile(ModelMap model) throws JzMainException {
        try {
            model.addAttribute("mdId", UUID.randomUUID().toString());
            return "path:toJzFile";
        } catch (JzMainException e) {
            throw e;
        } catch (Throwable e) {
            throw new JzMainException("to JzFile failed", e);
        }

    }

    public String toIndexJzFile(ModelMap model) throws JzMainException {
        try {
            model.addAttribute("mdId", UUID.randomUUID().toString());
            return "path:toIndexJzFile";
        } catch (JzMainException e) {
            throw e;
        } catch (Throwable e) {
            throw new JzMainException("to JzFile failed", e);
        }

    }



    public String queryListInfoJzMains(JzMainCondition conditions,
                                       @PagerParam(name = PagerParam.SORT, defaultvalue = "creat_date") String sortKey,
                                       @PagerParam(name = PagerParam.DESC, defaultvalue = "true") boolean desc,
                                       @PagerParam(name = PagerParam.OFFSET) long offset,
                                       @PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
            throws JzMainException {
        // Constant.component_type_actionimpl
        try {
            if (sortKey != null && !sortKey.equals("")) {
                conditions.setSortKey(sortKey);
                conditions.setSortDesc(desc);
            }
            String jzTitle = conditions.getJzTitle();
            if (jzTitle != null && !jzTitle.equals("")) {
                conditions.setJzTitle("%" + jzTitle + "%");
            }
            if(!"1".equals(AccessControl.getAccessControl().getUserID())){
                conditions.setCreater(AccessControl.getAccessControl().getUserID());
            }
            ListInfo jzMains = jzMainService.queryListInfoJzMains(conditions, offset, pagesize);
            model.addAttribute("jzMains", jzMains);
            return "path:queryListInfoJzMains";
        } catch (JzMainException e) {
            throw e;
        } catch (Exception e) {
            throw new JzMainException("pagine query JzMain failed:", e);
        }

    }
    public String queryListJzMains(JzMainCondition conditions, ModelMap model) throws JzMainException {
        try {
            String jzTitle = conditions.getJzTitle();
            if (jzTitle != null && !jzTitle.equals("")) {
                conditions.setJzTitle("%" + jzTitle + "%");
            }
            List<JzMain> jzMains = jzMainService.queryListJzMains(conditions);
            model.addAttribute("jzMains", jzMains);
            return "path:queryListJzMains";
        } catch (JzMainException e) {
            throw e;
        } catch (Exception e) {
            throw new JzMainException("query JzMain failed:", e);
        }

    }
    public String toUpdateJzMain(String jzId, ModelMap model) throws JzMainException {
        try {
            JzMain jzMain = jzMainService.getJzMain(jzId);
            model.addAttribute("jzMain", jzMain);
            return "path:updateJzMain";
        } catch (JzMainException e) {
            throw e;
        } catch (Throwable e) {
            throw new JzMainException("get JzMain failed::jzId=" + jzId, e);
        }

    }
    public String toAddJzMain(ModelMap model) {
        String mdId = UUID.randomUUID().toString();
        List<JzDf> areaList = jzMainService.queryListJzDf(0,mdId);
        List<JzDf> indusList = jzMainService.queryListJzDf(1,mdId);

        List<JzBasic> aList = jzMainService.queryListJzBasic(0);
        List<JzBasic> iList = jzMainService.queryListJzBasic(1);

        model.addAttribute("areaList", areaList);
        model.addAttribute("indusList", indusList);
        model.addAttribute("aList", aList);
        model.addAttribute("iList", iList);
        model.addAttribute("miid",JSON.toJSONString(mdId) );
        return "path:addJzMain";
    }

    public String toIndexAddJzMain(ModelMap model,String caseID) {
        String mdId = UUID.randomUUID().toString();
        //下拉选项
        List<JzBasic> selA = new ArrayList<JzBasic>();
        List<JzBasic> selD = new ArrayList<JzBasic>();

        //默认基础数据（170个国家47个部门）
        List<JzBasic> aList = new ArrayList<JzBasic>();
        List<JzBasic> iList = new ArrayList<JzBasic>();

        // 模型区域行业定义
        List<JzDf> areaListDf = new ArrayList<JzDf>();
        List<JzDf> indusListDf =new ArrayList<JzDf>();

        //载入时  1、删除原有配置；2、复制定义 3、复制配置新分类关系；
        String userId = AccessControl.getAccessControl().getUserID();
        String currentDate = DateUtils.getLongDateStr();
        //queryListJzAreaIndus
        if(caseID!=null&&caseID!=""){
            //删除定义区域分类、行业分类
//            jzMainService.deleteJzdfByMdIdOnly(mdId);
            //存入定义区域分类、行业分类
            List<JzDf> sourceDflist =jzMainService.queryListJzDfAll(caseID);
            if(sourceDflist.size()>0){
                List<JzDf> batchDflist = new ArrayList<JzDf>();
                for(int i=0 ; i<sourceDflist.size(); i++){
                    JzDf jzDf = sourceDflist.get(i);
                    jzDf.setMdId(mdId);
                    jzDf.setDfId(UUID.randomUUID().toString());
                    jzDf.setCreatDate(currentDate);
                    jzDf.setCreater(userId);
                    batchDflist.add(jzDf);
                }
                jzMainService.batchAddJzDf(batchDflist);
            }

            // 获取载入后的区域、行业定义
            areaListDf =  jzMainService.queryListJzDf(0,mdId);
            indusListDf =jzMainService.queryListJzDf(1,mdId);

            //重新分类
           /* List<JzAreaIndus> jzAreaIndusA = jzMainService.queryListJzAreaIndus(0,caseID);
            List<JzAreaIndus> jzAreaIndusD = jzMainService.queryListJzAreaIndus(1,caseID);*/

            List<JzAreaIndus> jzAreaIndusAll = jzMainService.queryListJzAreaIndusAll(caseID);


            for (int i = 0; i<areaListDf.size();i++){
                JzBasic jzA  = new JzBasic();
                jzA.setDfTitle(areaListDf.get(i).getDfTitle());
                selA.add(jzA);
            }
            for (int m = 0; m<indusListDf.size();m++){
                JzBasic jzD  = new JzBasic();
                jzD.setDfTitle(indusListDf.get(m).getDfTitle());
                selD.add(jzD);
            }


            for(int m =0 ;m <jzAreaIndusAll.size();m++){
                JzBasic jzBasic = new JzBasic();
                jzBasic.setDfTitle(jzAreaIndusAll.get(m).getAiBlongNew());
                jzBasic.setDicType(jzAreaIndusAll.get(m).getAiType());
                jzBasic.setDicTitle(jzAreaIndusAll.get(m).getAiName());
                jzBasic.setRemark(jzAreaIndusAll.get(m).getAiRemark());
                jzBasic.setBelongs(jzAreaIndusAll.get(m).getAiBlongBefore());
                jzBasic.setSortNo(jzAreaIndusAll.get(m).getSortNo());
                if("0".equals(jzBasic.getDicType())){
                    aList.add(jzBasic);
                }else{
                    iList.add(jzBasic);
                }

            }
        }else {
            // 区域 行业
            aList= jzMainService.queryListJzBasic(0);
            iList = jzMainService.queryListJzBasic(1);
            /*selA.addAll(aList);
            selD.addAll(iList);*/
        }

        //区域行业分类定义
        model.addAttribute("areaList", areaListDf);//dfTitle
        model.addAttribute("indusList", indusListDf);

        // 区域行业数据
        model.addAttribute("aList", aList);//dfTitle
        model.addAttribute("iList", iList);

        // 区域行业下拉选项
        model.addAttribute("selA", selA);
        model.addAttribute("selD", selD);
        model.addAttribute("miid",JSON.toJSONString(mdId));
        return "path:toIndexAddJzMain";
    }

    public String toImpAgg(ModelMap model) {
        return "path:toImpAgg";
    }

    public @ResponseBody String impAggExcel(MultipartFile file){
        try {
            if(!file.isEmpty()) {
                jzMainService.addAggExcel(file);
                return "success";
            } else {
                return "xls数据为空!";
            }
        } catch (Exception e) {
            log.error("impAgg failed:", e);
            return e.getMessage();
        }

    }

    public void  expAggExcel(HttpServletResponse response,String jzId){

        try {
            Map<String, Object> beanParams = new HashMap<String, Object>();

            JzMain jzMain = jzMainService.getJzMain(jzId);
            String mdId = jzMain.getMdId();
            List<JzDf> areaJzDfList = jzMainService.queryListJzDf(0,mdId);
            List<JzDf> indusJzDfList = jzMainService.queryListJzDf(1,mdId);
            List<JzAreaIndus> areaJzAreaIndusList = jzMainService.getSymbJz(mdId,"0");
            List<JzAreaIndus> indusAreaIndusList = jzMainService.getSymbJz(mdId,"1");

            beanParams.put("jzMain", jzMain);
            beanParams.put("areaJzDfList", areaJzDfList);
            beanParams.put("indusJzDfList", indusJzDfList);
            beanParams.put("areaJzAreaIndusList", areaJzAreaIndusList);
            beanParams.put("indusAreaIndusList", indusAreaIndusList);
            Workbook workbook = ExcelExportUtil.exportExcel(beanParams,JzMainController.class,"agg.xls");
            ExcelExportUtil.sendFile(response,  "分类_"+jzMain.getJzTitle()+".xls",workbook);

        } catch (Exception e) {
            log.error("impAgg failed:", e);
        }

    }

    public void  expCaseExcel(HttpServletResponse response,String jzId,String runId){

        try {
            Map<String, Object> beanParams = new HashMap<String, Object>();
            ModelRun modelRun = modelRunService.getModelRun(runId);
            JzMain jzMain = jzMainService.getJzMainByMdId(jzId);
            String mdId = jzMain.getMdId();
            List<JzDf> areaJzDfList = jzMainService.queryListJzDf(0,mdId);
            List<JzDf> indusJzDfList = jzMainService.queryListJzDf(1,mdId);
            List<JzAreaIndus> areaJzAreaIndusList = jzMainService.getSymbJz(mdId,"0");
            List<JzAreaIndus> indusAreaIndusList = jzMainService.getSymbJz(mdId,"1");
            String colsureType = modelRun.getColsureType();
            if("BookClosure".equals(colsureType)) {
                modelRun.setColsureType("标准闭合");
            }else if("ShortClosure".equals(colsureType)) {
                modelRun.setColsureType("短期闭合");
            }else {
                modelRun.setColsureType("自定义闭合");
            }

            beanParams.put("jzMain", jzMain);
            beanParams.put("modelrun", modelRun);
            beanParams.put("areaJzDfList", areaJzDfList);
            beanParams.put("indusJzDfList", indusJzDfList);
            beanParams.put("areaJzAreaIndusList", areaJzAreaIndusList);
            beanParams.put("indusAreaIndusList", indusAreaIndusList);
            Workbook workbook = ExcelExportUtil.exportExcel(beanParams,JzMainController.class,"case.xls");
            ExcelExportUtil.sendFile(response,  "案例_"+modelRun.getRunName()+".xls",workbook);

        } catch (Exception e) {
            log.error("impAgg failed:", e);
        }

    }








    public String toImpCase(ModelMap model) {
        return "path:toImpCase";
    }

    public @ResponseBody  Map<String, Object> impCaseExcel(MultipartFile file,Map<String, Object> map){
        try {
            if(!file.isEmpty()) {
                Map<String, Object> rt =  jzMainService.addCaseExcel(file);
                return rt;
            } else {
                map.put("flag","error");
                return map;
            }
        } catch (Exception e) {
            log.error("impCase failed:", e);
            map.put("flag","error");
            return map;

        }

    }


    public String toReName(String jzId,ModelMap model) {
        JzMain jzMain = jzMainService.getJzMain(jzId);
        model.addAttribute("jzMain", jzMain);
        return "path:toReName";
    }

    public @ResponseBody String updateJzTitle(JzMain jzMain) {
        try {
            jzMainService.updateJzTitle(jzMain);
            return "success";
        } catch (Throwable e) {
            log.error("update JzMain failed:", e);
            return StringUtil.formatBRException(e);
        }

    }


    public String index() {
        return "path:index";

    }
    public @ResponseBody  List<JzMain> querySymbJzMain(Mshorck bean){
        List<JzMain> symbList = null;
        try {
            symbList = jzMainService.querySymbJzMain();
        } catch (Throwable e) {
            log.error("update JzMain failed:", e);
        }
        return  symbList;
    }

    public @ResponseBody  Map<String ,List<String>> getShorckElement(Mshorck bean){
        String elemDir = PropertiesUtils.readKeyValue("model.properties", "shorckElemDir");
        Map<String ,List<String>> shorckEle = new LinkedHashMap<String ,List<String>>();
        String shorck[] = new String[4];
        shorck[0]=bean.getShorckS1();shorck[1]=bean.getShorckS2();
        shorck[2]=bean.getShorckS3();shorck[3]=bean.getShorckS4();
        try{
            for (int i = 0 ;i<shorck.length;i++){
                if(!StringUtil.isEmpty(shorck[i])){
                    List<String> elems = new ArrayList<String>();
                    elems.add("All "+shorck[i]);
                    // 创建CSV读对象ENDW_COMM.csv
                    CsvReader csvReader = new CsvReader(elemDir+shorck[i]+".csv");
                    // 读表头
                    csvReader.readHeaders();
                    while (csvReader.readRecord()){
                        // 读一整行
                        elems.add(csvReader.getRawRecord().split(",")[0]);
                    }
                    shorckEle.put(shorck[i],elems);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  shorckEle;
    }

    public @ResponseBody String  combineToCMF(String jz,String colsure,String shorck){
        //TODO
        jzMainService.creatCMF(colsure,shorck);
        return  "文件创建成功！";
    }

    public @ResponseBody String updateJzDfA(JzDf jzDf) {
        try {
            // 判断id 是否存在
            JzDf bean =   jzMainService.getJzDfById(jzDf.getDfId());
            if(bean ==null){
                jzMainService.addJzDf(jzDf);
            }else {
                jzMainService.updateJzDf(jzDf);
            }
            return "success";
        } catch (Throwable e) {
            log.error("update updateJzDf failed:", e);
            return StringUtil.formatBRException(e);
        }

    }

    public @ResponseBody String deleteJzDfById(String dfId) {
        try {
            jzMainService.deleteJzDfById(dfId);
            return "success";
        } catch (JzMainException e) {
            log.error("delete JzDf failed:", e);
            return StringUtil.formatBRException(e);
        } catch (Throwable e) {
            log.error("delete JzDf failed:", e);
            return StringUtil.formatBRException(e);
        }

    }

    public @ResponseBody String updateJzDfI(JzDf jzDf) {
        try {
            jzDf.setDfType("1");
            if(StringUtil.isEmpty(jzDf.getDfId())){
                jzMainService.addJzDf(jzDf);
            }else {
                jzMainService.updateJzDf(jzDf);
            }
            return "success";
        } catch (Throwable e) {
            log.error("update updateJzDf failed:", e);
            return StringUtil.formatBRException(e);
        }

    }

    public @ResponseBody List<JzDf> refSelect(int dfType,String mdId) {
        List<JzDf> rtList = null;
        try {
            rtList = jzMainService.queryListJzDf(dfType,mdId);
        } catch (Throwable e) {
            log.error("update JzMain failed:", e);
        }
        return rtList;
    }

    /**
     * 下载加总文件结果集（打包下载）
     * @param request
     * @return
     */
    public void downloadJZRS(HttpServletRequest request,HttpServletResponse response) {
        try {
            String jzId = request.getParameter("jzIds");
            JzMain jzMain = jzMainService.getJzMain(jzId);
            Map<File,String> m = new HashMap<File, String>();//保存需要打包的文件
            String filePath = jzMain.getOutputDir();
            File file = new File(filePath);
            /**
             * 取出需要下载的文件
             */
            File [] files = file.listFiles();
            for(File a:files)
            {
                m.put(a,a.getName());
            }
            //下载
            String packageName;
            try {
                packageName = URLDecoder.decode(jzMain.getJzTitle(),"UTF-8");
                response.setContentType("application/zip");
                response.setHeader("Content-Disposition","attachment;filename=\"" + new String(packageName.getBytes(),"ISO-8859-1") + ".rar\"");
                DownloadUtils.zipDownLoad(m, response);
            } catch (Exception e) {
                throw new JzMainException("page download", e);
            }
        } catch (JzMainException e) {
            log.error("download result failed:", e);
        } catch (Throwable e) {
            log.error("download result failed:", e);
        }

    }


    public  @ResponseBody List<ModelRun> refSimulateList(ModelRunCondition conditions, @PagerParam(name = PagerParam.SORT, defaultvalue = "creat_date") String sortKey,
                                                         @PagerParam(name = PagerParam.DESC, defaultvalue = "true") boolean desc) {
        List<ModelRun> modelRuns = null;
        try {
            if (sortKey != null && !sortKey.equals("")) {
                conditions.setSortKey(sortKey);
                conditions.setSortDesc(desc);
            }
            if(!"1".equals(AccessControl.getAccessControl().getUserID())){
                conditions.setCreater(AccessControl.getAccessControl().getUserID());
            }
            modelRuns = modelRunService.queryListModelRuns(conditions);

        } catch (Exception e) {
            throw new ModelRunException("query ModelRun failed:", e);
        }

        return modelRuns;

    }

    public  @ResponseBody List<JsTree>  refSimulateTree(ModelRunCondition conditions) {
        List<JsTree> modelRuns = null;

        try {
            if(!"1".equals(AccessControl.getAccessControl().getUserID())&&!UserUtils.isHasRole("teacher")){
                conditions.setCreater(AccessControl.getAccessControl().getUserID());
            }
            modelRuns = modelRunService.refSimulateTree(conditions);

        } catch (Exception e) {
            throw new ModelRunException("query ModelRun failed:", e);
        }

        return modelRuns;

    }


    public @ResponseBody List<JzMain> refSimulateSelect(String yearMouth) {
        List<JzMain> jzList = null;
        try {
            jzList = modelRunService.queryJZListWithYM(yearMouth);
        } catch (Throwable e) {
            log.error("update JzMain failed:", e);
        }
        return jzList;
    }

    public String toSimulate(String type,ModelMap model) throws JzMainException {
        try {

//            //加总数据列表
//            List<JzMain> jzList = modelRunService.queryJZList();
//            Map<String ,JzMain> jzMap = new LinkedHashMap<String ,JzMain>();
//            for (int i= 0 ;i<jzList.size();i++){
//                jzMap.put(jzList.get(i).getMdId(),jzList.get(i));
//            }

            //冲击数据列表
            List<Mshorck> shorckList = modelRunService.queryListMshorck();
            Map<String ,Mshorck> shorckMap = new LinkedHashMap<String ,Mshorck>();
            for (int i= 0 ;i<shorckList.size();i++){
                shorckMap.put(shorckList.get(i).getShorckId(),shorckList.get(i));
            }
            model.addAttribute("shorckMap", JSON.toJSONString(shorckMap));
//            model.addAttribute("jzMap", JSON.toJSONString(jzMap));
//            model.addAttribute("jzList", jzList);
            model.addAttribute("menu_id", 4);
            model.addAttribute("type", type);

            /*if(!UserUtils.isHasRole("test")) { //首页菜单权限
                return "path:toPermission";
            }*/

            return "path:toSimulate";
        } catch (JzMainException e) {
            throw e;
        } catch (Throwable e) {
            throw new JzMainException("to JzFile failed", e);
        }

    }



    public void downParamExplain(HttpServletRequest request, HttpServletResponse response) {
        String SRDIR= PropertiesUtils.readKeyValue("model.properties", "CHN-GEO");
        try{
            File file = new File(SRDIR+"explain.xls");
            DownloadUtils.download("explain.xls", file,"application/octet-stream", false,response);
        }catch (JzMainException e) {
            log.error("download result failed:", e);
        } catch (Throwable e) {
            log.error("download result failed:", e);
        }
    }

    public @ResponseBody List<String> getYearMouth() {
        List<String> list = null;
        try {
            list = jzMainService.getYearMouth();
        } catch (Throwable e) {
            log.error("update JzMain failed:", e);
        }
        return list;
    }

    /**
     * 区域、行业模板载入操作
     * 1、删除以前数据
     * 2、批量插入
     * 3、查询当前插入数据
     * @param sourMdId
     * @param mdId
     * @param type
     * @return
     */
    public @ResponseBody Map<String,List> getSymbDatas(String sourMdId,String mdId,String type) {
        Map<String,List> map = new HashMap<String,List>();
        try {
            //删除定义区域分类、行业分类
            jzMainService.deleteJzdfByMdId(mdId,type);
            //删除原来重新归类数据
            jzMainService.deleteJzDetailByMdId(mdId,type);


            List<JzDf> sourceDflist =jzMainService.queryListJzDf(Integer.valueOf(type),sourMdId);
            if(sourceDflist.size()>0){
                List<JzDf> batchDflist = new ArrayList<JzDf>();
                for(int i=0 ; i<sourceDflist.size(); i++){
                    JzDf jzDf = sourceDflist.get(i);
                    jzDf.setMdId(mdId);
                    jzDf.setDfId(UUID.randomUUID().toString());
                    jzDf.setCreatDate(DateUtils.getLongDateStr());
                    jzDf.setCreater(AccessControl.getAccessControl().getUserID());
                    batchDflist.add(jzDf);
                }
                jzMainService.batchAddJzDf(sourceDflist);
            }

            List<JzDf> dflistAorI = jzMainService.getSymbJzDf(mdId,type);
            List<JzAreaIndus> SymbJz = jzMainService.getSymbJz(sourMdId,type);
            map.put("dfAorI",dflistAorI);
            map.put("vAorI",SymbJz);
        } catch (JzMainException e) {
            log.error("get or update getSymbDatas failed:", e);
        }
        return map;
    }


    public @ResponseBody  Map<String ,Object> readCsvToMap(String id,String csv){
        Map<String ,Object> resMap = new HashMap();
        try{
            String rootId = id.split("_")[0];
            String  paramID= id.split("_")[1];
            JsTree jsTree = modelRunService.getVariableById(paramID);
            ModelRun modelRun = modelRunService.getModelRun(rootId);
            String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
            System.out.println("SRDIR==========="+SRDIR);
            String filePath  = SRDIR+File.separator+modelRun.getRunId();
            System.out.println("filePath==========="+filePath);
            resMap.put("csv",readCsvShow(filePath+File.separator+csv+".csv"));

        }catch (Exception e){
            throw new ModelRunException("page download", e);
        }
        return resMap;
    }


    public List<String> readCsvShow(String path) {
        ArrayList arrReg = new ArrayList();
        try{
            CsvReader csvReader = new CsvReader(path);

            while (csvReader.readRecord()){
                // System.out.println(csvReader.getRawRecord());
                arrReg.add(csvReader.getRawRecord());
            }
            csvReader.close();
        }catch (Exception e){
            throw new ModelRunException("readCsvShow", e);
        }
        return arrReg;

    }
    public @ResponseBody  int  checkJzName(String jzTitle){
        int countName = 0;
        try {
            countName = jzMainService.checkJzName(jzTitle);
        } catch (Throwable e) {
            log.error("checkJzName  failed:", e);
        }
        return countName;
    }
    public @ResponseBody List<ModelRun> getAggModelRunNo(String jzId){
        JzMain jzMain  = jzMainService.getJzMain(jzId);
        try {
            List<ModelRun>  list  = modelRunService.getAggModelRunNo(jzMain.getMdId());
            return list;
        } catch (ModelRunException e) {
            throw e;
        } catch (Throwable e) {
            throw new ModelRunException(" get AggModelRunNo failed::mdid=" + jzId, e);
        }

    }
}
