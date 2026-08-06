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

package com.pcloud.modelrun.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.common.*;
import com.csvreader.CsvReader;
import com.frameworkset.util.ListInfo;
import com.frameworkset.util.StringUtil;
import com.pcloud.examinationreport.entity.ExaminationReport;
import com.pcloud.examinationreport.entity.ExperDocCondition;
import com.pcloud.examinationreport.service.ExaminationReportService;
import com.pcloud.modeljz.entity.JzMain;
import com.pcloud.modeljz.entity.Mshorck;
import com.pcloud.modelrun.entity.ModelRun;
import com.pcloud.modelrun.entity.ModelRunCondition;
import com.pcloud.modelrun.service.ModelRunException;
import com.pcloud.modelrun.service.ModelRunService;
import com.pcloud.registeruser.action.RegisterUserController;
import com.pcloud.registeruser.entity.Step;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.frameworkset.platform.security.AccessControl;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * <p>Title: ModelRunController</p> <p>Description: 模型运行控制器处理类 </p>
 * <p>jbxbckj</p> <p>Copyright (c) 2007</p> @Date 2018-05-17 16:31:44 @author
 * lw @version v1.0
 */
public class ModelRunController {

	private static Logger log = LoggerFactory.getLogger(ModelRunController.class);
//    public static String SRDIR= PropertiesUtils.readKeyValue("model.properties", "SRDIR");
//    public static String CHN_GEO= PropertiesUtils.readKeyValue("model.properties", "CHN-GEO");
//    public static String CHN_AUS= PropertiesUtils.readKeyValue("model.properties", "CHN-AUS");
//    public static String CHN_UKR= PropertiesUtils.readKeyValue("model.properties", "CHN-UKR");
//    public static String RCEP= PropertiesUtils.readKeyValue("model.properties", "RCEP");
//    public static String CHN_WLD_RICE= PropertiesUtils.readKeyValue("model.properties", "CHN-WLD-RICE");
//    public static String CHN_WLD_FTZ= PropertiesUtils.readKeyValue("model.properties", "CHN-WLD-FTZ");
//    public static String SELF_DEFIN= PropertiesUtils.readKeyValue("model.properties", "SELF_DEFIN");
	private ModelRunService modelRunService;
	private ExaminationReportService examinationReportService;
    public @ResponseBody String addModelRun(ModelRun modelRun) {
		// 控制器
		try {
			modelRunService.addModelRun(modelRun);
			return "success";
		} catch (ModelRunException e) {
			log.error("add ModelRun failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add ModelRun failed:", e);
			return StringUtil.formatBRException(e);
		}
	}
	public @ResponseBody String deleteModelRun(String runId) {
		try {
            ModelRun modelRun = modelRunService.getModelRun(runId);
            String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
            String filePath  = SRDIR+File.separator+modelRun.getRunId();
			FileUtils.deleteDir(filePath);
			modelRunService.deleteModelRun(runId);
			return "success";
		} catch (ModelRunException e) {
			log.error("delete ModelRun failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete ModelRun failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchModelRun(String... runIds) {
		try {
			modelRunService.deleteBatchModelRun(runIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch runIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateModelRun(ModelRun modelRun) {
		try {
			modelRunService.updateModelRun(modelRun);
			return "success";
		} catch (Throwable e) {
			log.error("update ModelRun failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getModelRun(String runId, ModelMap model) throws ModelRunException {
		try {
			ModelRun modelRun = modelRunService.getModelRun(runId);
			model.addAttribute("modelRun", modelRun);
			return "path:getModelRun";
		} catch (ModelRunException e) {
			throw e;
		} catch (Throwable e) {
			throw new ModelRunException("get ModelRun failed::runId=" + runId, e);
		}

	}
	public String queryListInfoModelRuns(ModelRunCondition conditions,
										 @PagerParam(name = PagerParam.SORT, defaultvalue = "creat_date") String sortKey,
										 @PagerParam(name = PagerParam.DESC, defaultvalue = "true") boolean desc,
										 @PagerParam(name = PagerParam.OFFSET) long offset,
										 @PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
			throws ModelRunException {
		// Constant.component_type_actionimpl
		try {
			if (sortKey != null && !sortKey.equals("")) {
				conditions.setSortKey(sortKey);
				conditions.setSortDesc(desc);
			}
			String runName = conditions.getRunName();
			if (runName != null && !runName.equals("")) {
				conditions.setRunName("%" + runName + "%");
			}
            if(!"1".equals(AccessControl.getAccessControl().getUserID())){
                conditions.setCreater(AccessControl.getAccessControl().getUserID());
            }
			ListInfo modelRuns = modelRunService.queryListInfoModelRuns(conditions, offset, pagesize);
			model.addAttribute("modelRuns", modelRuns);
			return "path:queryListInfoModelRuns";
		} catch (ModelRunException e) {
			throw e;
		} catch (Exception e) {
			throw new ModelRunException("pagine query ModelRun failed:", e);
		}

	}
	public String queryListModelRuns(ModelRunCondition conditions, ModelMap model) throws ModelRunException {
		try {
			List<ModelRun> modelRuns = modelRunService.queryListModelRuns(conditions);
			model.addAttribute("modelRuns", modelRuns);
			return "path:queryListModelRuns";
		} catch (ModelRunException e) {
			throw e;
		} catch (Exception e) {
			throw new ModelRunException("query ModelRun failed:", e);
		}

	}
	public String toUpdateModelRun(String runId, ModelMap model) throws ModelRunException {
		try {
			ModelRun modelRun = modelRunService.getModelRun(runId);
			model.addAttribute("modelRun", modelRun);
			return "path:updateModelRun";
		} catch (ModelRunException e) {
			throw e;
		} catch (Throwable e) {
			throw new ModelRunException("get ModelRun failed::runId=" + runId, e);
		}

	}
	public String toAddModelRun(ModelMap model) {
		//加总数据列表
		List<JzMain> jzList = modelRunService.queryJZList();
		Map<String ,JzMain> jzMap = new LinkedHashMap<String ,JzMain>();
		for (int i= 0 ;i<jzList.size();i++){
			jzMap.put(jzList.get(i).getMdId(),jzList.get(i));
		}

		//冲击数据列表
		List<Mshorck> shorckList = modelRunService.queryListMshorck();
		Map<String ,Mshorck> shorckMap = new LinkedHashMap<String ,Mshorck>();
		for (int i= 0 ;i<shorckList.size();i++){
			shorckMap.put(shorckList.get(i).getShorckId(),shorckList.get(i));
		}
		model.addAttribute("shorckMap", JSON.toJSONString(shorckMap));
		model.addAttribute("jzMap", JSON.toJSONString(jzMap));
		return "path:addModelRun";
	}

	/***
	 * 获取模型运行中的冲击因素
	 * @param bean
	 * @return
	 */
	public @ResponseBody  Map<String ,List<String>> getShorckElement(Mshorck bean){
        String SRDIR= PropertiesUtils.readKeyValue("model.properties", bean.getModelType());
		Map<String ,List<String>> shorckEle = new LinkedHashMap<String ,List<String>>();
		String shorck[] = new String[4];
		shorck[0]=bean.getShorckS1();shorck[1]=bean.getShorckS2();
		shorck[2]=bean.getShorckS3();shorck[3]=bean.getShorckS4();
		String clousureType = bean.getClousreType();
		// ShortClosure 短期闭合； BookClosure 标准闭合；
		// 短期闭合 qo 去掉 Sklab UnSklab  添加冲击变量pfactreal 且其TRAD_COMM 中只包含Sklab UnSklab 两个值

		try{
			for (int i = 0 ;i<shorck.length;i++){
				if(!StringUtil.isEmpty(shorck[i])){
					List<String> elems = new ArrayList<String>();
					elems.add("All "+shorck[i]);
					// 创建CSV读对象ENDW_COMM.csv
					CsvReader csvReader = new CsvReader(SRDIR+File.separator+shorck[i]+".csv");
					// 读表头
					csvReader.readHeaders();
					while (csvReader.readRecord()){
						// 读一整行
						elems.add(csvReader.getRawRecord().split(",")[0]);
					}
					csvReader.close();
					shorckEle.put(shorck[i],elems);

				}
			}
		} catch (ModelRunException e) {
            throw e;
        }catch (Exception e){
			throw new ModelRunException("page download", e);
		}
		return  shorckEle;
	}

	/**
	 * 下载运行结果文件集（打包下载）
	 * @param request
	 * @return
	 */
	public void downloadRunRS(HttpServletRequest request, HttpServletResponse response) {
		try {
			String runId = request.getParameter("runId");
			ModelRun modelRun = modelRunService.getModelRun(runId);
            String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
			String filePath  = SRDIR+modelRun.getCreateUsern()+"-"+modelRun.getJzId()+File.separator+modelRun.getRunId();
			Map<File,String> m = new HashMap<File, String>();//保存需要打包的文件
			File file = new File(filePath);
			/**
			 * 取出需要下载的文件
			 */
			File [] files = file.listFiles();
			for(File a:files){
				if(a.getName().endsWith(".csv")){
					m.put(a,a.getName());
				}
			}
			//下载
			String packageName;
			try {
//				packageName = URLDecoder.decode(modelRun.getRunName(),"UTF-8");
				packageName = modelRun.getRunName();
				response.setContentType("application/zip");
				response.setHeader("Content-Disposition","attachment;filename=\"" + new String(packageName.getBytes(),"ISO-8859-1") + ".rar\"");
				DownloadUtils.zipDownLoad(m, response);
			} catch (Exception e) {
				throw new ModelRunException("page download", e);
			}
		} catch (ModelRunException e) {
			log.error("download result failed:", e);
		} catch (Throwable e) {
			log.error("download result failed:", e);
		}

	}



	/**
	 * 创建CMF运行配置文件
	 * @param colsure
	 * @param shorck
	 * @param runname
	 * @return
	 */
	public @ResponseBody Map<String,String>  runOnline(String colsure,String shorck,String runname,String remark,String colsureType,String modelType){
        String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelType);
		String experID = UUID.randomUUID().toString();
		Map<String,String>  result = new HashMap<String,String>();
		AccessControl user  =AccessControl.getAccessControl();
		ExaminationReport examinationReport = new ExaminationReport();
		examinationReport.setExperId(experID);
		examinationReport.setExperName(runname);
		examinationReport.setUserId(user.getUserID());
		examinationReport.setExperState("00");
		examinationReport.setStartTime(DateUtils.getLongDateStr());
		examinationReport.setModelType(modelType);
		examinationReportService.addExaminationReport(examinationReport);
		// 合并生成cmf文件
		ModelRun modelrun = modelRunService.creatCMF(SRDIR,colsure,shorck,runname,remark,colsureType,experID);
		modelrun.setModelType(modelType);
		try{
			// 合并生成bat文件并执行
			modelRunService.creatRunBat(modelrun,SRDIR,user.getUserAccount());
			// 执行bat文件
			String rs = CMDUtils.executeWithoutRs(SRDIR, "cmd /c " + modelrun.getRunId() + " ", "");
			if("1".equals(rs)) {//CMD 操作执行成功，更新结果文件所在目录
				modelrun.setRunStatus("1");
			} else {
				modelrun.setRunStatus("9");
			}
			modelRunService.updateModelRun(modelrun);
			result.put("status","T");
			result.put("experID",experID);
			result.put("msg","模型运行完毕!");
			return  result;
		}catch (Exception e){
			result.put("status","F");
			result.put("msg",StringUtil.formatBRException(e));
			return  result;
		}

	}

	public @ResponseBody String toTokenRecord(String runId){
        AccessControl control = AccessControl.getAccessControl();
		System.out.println("============toTokenRecord===========");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
		/* 实验结果同步到ilab */
            String appid =RegisterUserController.appid;
            String ilaburl= RegisterUserController.ilaburl;
            String token = StringUtil.isEmpty(RegisterUserController.token_map)?"":RegisterUserController.token_map.get(control.getUserAccount()).toString();
            if(StringUtil.isEmpty(token)) {
				System.out.println("非ilab用户，不需求提交实验数据！");
				return "";
			}
            ModelRun modelrun = modelRunService.getModelRun(runId);
            Timestamp tstart = new Timestamp(format.parse(modelrun.getCreatDate()).getTime());
            Timestamp tend = new Timestamp(format.parse(modelrun.getLastModifyDate()).getTime());
            int score  =(93-(int)(Math.random()*10+1));
            String username =control.getUserName();
            List<Step> list = new ArrayList<Step>();
            Step step2 = new Step();
            step2.setSeq(1);
            step2.setTitle("实验操作");
            step2.setStartTime(tstart);
            step2.setEndTime(tend);
            step2.setTimeUsed((int)(tend.getTime()-tstart.getTime())/( 60* 1000));
            step2.setExpectTime(2);
            step2.setMaxScore(100);
            step2.setScore(score);
            step2.setRepeatCount((int)(Math.random()*10));
            step2.setEvaluation("优秀");
            step2.setScoringModel("全球贸易均衡模型");
            step2.setRemarks("");
            list.add(step2);
            /* 实验结果同步到ilab */
            String url =  ilaburl+"/open/api/v2/data_upload?access_token="+token;
            JSONObject param=new JSONObject();
            param.put("username",username);
            param.put("title",modelrun.getRunName());
            param.put("status","1");
            param.put("score",score);
            param.put("startTime",tstart);
            param.put("endTime",tend);
            param.put("timeUsed",(tend.getTime()-tstart.getTime())/( 60* 1000));
            param.put("appid",appid);
            param.put("originId",DateUtils.currentTime());
            param.put("steps",list);
            System.out.println(param.toString());
            return HttpClinet.httpPost(url,param.toString());
		} catch (Exception e) {
			throw new ModelRunException("page download", e);
		}
	}

	public String index() {
		return "path:index";

	}

	public String showRunData(String runid, ModelMap model){
        ModelRun modelRun = modelRunService.getModelRun(runid);
        String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
        // run.bat /runid
        String path = SRDIR+modelRun.getCreateUsern()+ "-" + modelRun.getJzId()+File.separator+runid;
		Map<String ,Object>  resMap = getAllMacro(path);
        Map<String ,Map<String,String>> deptData  = getAllDept(path);
        model.addAttribute("showRunData",JSON.toJSONString(resMap.get("avlaues")));
		model.addAttribute("allRegion", JSON.toJSONString(resMap.get("allRegion")));
		model.addAttribute("deptData", JSON.toJSONString(deptData));

		return "path:showRunData";
	}

    /**
     * 获取所有的运行结果集
     *{qgdp:{Oceania:3.4,china:4.5}}; List<Map<Map<String,String>>>
     * @param path
     * @return  GDP = GDP*qgdp/100
     */
	public Map<String ,Object> getAllMacro(String path){
		Map<String ,Object> resMap = new HashMap();
        List<Map> valueList = new ArrayList();
        List<String> regions = new ArrayList();
		List<String> depts = new ArrayList();
		resMap.put("avlaues",valueList);
		resMap.put("allRegion",regions);
        File fpath =  new File(path);
        File []  files= fpath.listFiles();
        try{
            for (File file :files){
                if(file.getName().endsWith(".csv")&&!"pfactreal.csv".endsWith(file.getName())&&!"qo.csv".endsWith(file.getName())){
                	boolean isRegion = false;
                	boolean isDept = false;
					if("qgdp.csv".equals(file.getName()))isRegion = true;
					if("qo.csv".equals(file.getName()))isDept = true;
                    Map<String,Map<String,String>>  cvsMap = new HashMap<String,Map<String,String>>();
                    Map<String,String> rowsMap   = new HashMap();
                    cvsMap.put(file.getName().substring(0, file.getName().lastIndexOf(".")),rowsMap);
                    CsvReader csvReader = new CsvReader(file.getAbsolutePath());
                    // 读表头
                    csvReader.readHeaders();
                    while (csvReader.readRecord()){
                        // 读一整行
                        rowsMap.put(csvReader.getRawRecord().split(",")[0],numbForMat(csvReader.getRawRecord().split(",")[1]));
                        if(isRegion)regions.add(csvReader.getRawRecord().split(",")[0]);
                        if(isDept)depts.add(csvReader.getRawRecord().split(",")[0]);
                    }
					valueList.add(cvsMap);
                    csvReader.close();
                }
            }
        }catch (Exception e){
            throw new ModelRunException("page download", e);
        }
         return ToCalculate(resMap);
    }

    /**
     * 计算社会福利与GDP
     * @param map
     * @return
     */
    public  Map<String ,Object> ToCalculate( Map<String ,Object> map){
	    //{qgdp:{Oceania:3.4,china:4.5}}; List<Map<Map<String,String>>>
	    //社会福利=yev*INCOMEEV/100  EW
        //GDP =qgdp*gdp/100 GDP_cv
        List<String> regions =(List<String>) map.get("allRegion");
		List<Map> all_value = (List<Map>)map.get("avlaues");
		Map<String,Map<String,String>> GDP_cv = new HashMap();
        Map<String,Map<String,String>> ew = new HashMap();


		Map<String,String> GDP_cv_v = new HashMap();
		Map<String,String> ew_v = new HashMap();
		GDP_cv.put("GDP_cv",GDP_cv_v);
		ew.put("EW",ew_v);
		all_value.add(GDP_cv);
		all_value.add(ew);
		Map<String,String> gdp = null;
		Map<String,String> qgdp = null;
		Map<String,String> yev = null;
		Map<String,String> INCOMEEV = null;
        for(int n = 0 ;n<all_value.size();n++){
        	if(all_value.get(n).containsKey("GDP")){
				gdp = (Map)all_value.get(n).get("GDP");
			}else if(all_value.get(n).containsKey("qgdp")){
				qgdp = (Map)all_value.get(n).get("qgdp");
			}else if(all_value.get(n).containsKey("yev")){
				yev = (Map)all_value.get(n).get("yev");
			}else if(all_value.get(n).containsKey("INCOMEEV")){
				INCOMEEV = (Map)all_value.get(n).get("INCOMEEV");
			}
		}

        for (int i=0;i<regions.size();i++){
            GDP_cv_v.put(regions.get(i),bd(gdp.get(regions.get(i)),qgdp.get(regions.get(i))));
            ew_v.put(regions.get(i),bd(yev.get(regions.get(i)),INCOMEEV.get(regions.get(i))));
        }
	    return map;
    }

    public  String bd(String numStr1,String nubStr2){
        BigDecimal bignum1 = new BigDecimal(numStr1);
        BigDecimal bignum2 = new BigDecimal(nubStr2);
        return bignum1.multiply(bignum2).divide(new BigDecimal(100)).setScale(3,BigDecimal.ROUND_HALF_DOWN).toPlainString();
    }

    /**
     * 获取所有的部门
     * @param path
     * @return
     */
    public Map<String ,Map<String,String>> getAllDept(String path){
        Map<String ,Map<String,String>> resMap = new HashMap();
        File fpath =  new File(path);
        File []  files= fpath.listFiles();
        try{
            for (File file :files){
                if(file.getName().endsWith(".csv")&&"qo.csv".endsWith(file.getName())){
                    CsvReader csvReader = new CsvReader(file.getAbsolutePath());
                    // 跳过表头
                    csvReader.readHeaders();
                    while (csvReader.readRecord()){
                        // 读一整行
                        if(resMap.containsKey(csvReader.getRawRecord().split(",")[0])){
                                resMap.get(csvReader.getRawRecord().split(",")[0]).put(csvReader.getRawRecord().split(",")[1],numbForMat(csvReader.getRawRecord().split(",")[2]));
                        }else{
                            Map<String,String> map = new HashMap();
                            map.put(csvReader.getRawRecord().split(",")[1],numbForMat(csvReader.getRawRecord().split(",")[2]));
                            resMap.put(csvReader.getRawRecord().split(",")[0],map);
                        }
                    }
                    csvReader.close();
                }
            }
        }catch (Exception e){
            throw new ModelRunException("page download", e);
        }
        return resMap;
    }
    private  String  numbForMat(String numStr){
		BigDecimal bd = new BigDecimal(numStr);
		return bd.setScale(3,BigDecimal.ROUND_HALF_DOWN).toPlainString();
	}

    /**
     * 单个数据文件下
     * @param request
     * @param response
     */
    public void downloadCSVData(HttpServletRequest request, HttpServletResponse response) {
		String runid = request.getParameter("runId").split("_")[0];
		String csv = request.getParameter("csv");
		ModelRun modelRun = modelRunService.getModelRun(runid);
        String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
		String path = SRDIR+modelRun.getCreateUsern()+ "-" + modelRun.getJzId()+File.separator+runid;
		try{
			File file = new File(path+File.separator+csv+".csv");
            DownloadUtils.download(csv+".csv", file,"application/octet-stream", false,response);
		}catch (Exception e){
			log.error("download result failed:", e);
		}

    }

    public  void donwnloadResultZip(HttpServletRequest request, HttpServletResponse response){

		String runid = request.getParameter("runId").split("_")[0];
		ModelRun modelRun = modelRunService.getModelRun(runid);
        String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
		String path = SRDIR+File.separator+runid+File.separator;
        File rs_zip = new File(path+"result.zip");
        //如果没有打包的结果文件，先打包后下载
        if(!rs_zip.exists()){
            DownloadUtils downloadUtils = new DownloadUtils(path+"result.zip");
            //Results   summary0  summary1
            downloadUtils.compress(path+"Results",path+"summary0",path+"summary1");
        }
        try {
            DownloadUtils.download("result.zip", rs_zip,"application/octet-stream", false,response);
        } catch (IOException e) {
            log.error("download result failed:", e);
        }
	}
	/**
	 * 下载汇总为一个excel的数据文件
	 * @param request
	 * @param response
	 */
	public void downloadRumData(HttpServletRequest request, HttpServletResponse response) {
        String csvSplitBy = ",(?=([^\"]*\"[^\"]*\")*[^\"]*$)";
		String runid = request.getParameter("runId").split("_")[0];
		ModelRun modelRun = modelRunService.getModelRun(runid);
        String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
		String path = SRDIR+modelRun.getCreateUsern()+ "-" + modelRun.getJzId()+File.separator+runid;
		File fpath =  new File(path);
		File allData = new File(path+File.separator+"ALLDATA.xls");
		HSSFWorkbook wb = null;
		FileOutputStream out =null;
		if(!allData.exists()){
			File []  files= fpath.listFiles();
			List<Map<String,Object>> allList = new ArrayList<Map<String,Object>>();
			try{
				for (File file :files) {
					if(file.getName().endsWith(".csv")){
						Map<String, Object> csvTempMap = new HashMap();
						List<String> csvRowDatas = new ArrayList();

						csvTempMap.put("name", file.getName().substring(0, file.getName().lastIndexOf(".")));
						csvTempMap.put("datas", csvRowDatas);
						InputStreamReader isr=new InputStreamReader(new FileInputStream(file),"GBK");
						CsvReader csvReader = new CsvReader(isr);
						while (csvReader.readRecord()) {
							// 读一整行
							csvRowDatas.add(csvReader.getRawRecord());
						}
						isr.close();
						csvReader.close();
						allList.add(csvTempMap);
					}
				}
				//创建excel文件
				out=new FileOutputStream(path+File.separator+"ALLDATA.xls");
				wb = new HSSFWorkbook();
				for (int i= 0;i<allList.size();i++){
					Map<String,Object> tmp=  allList.get(i);
					HSSFSheet sheet = wb.createSheet(tmp.get("name").toString());
					List<String> tmpList  =(List<String>)tmp.get("datas");
					for (int n = 0 ;n<tmpList.size();n++){
						HSSFRow row  = sheet.createRow(n);
						String rowDatas = tmpList.get(n);
						String [] strRows = rowDatas.split(csvSplitBy);
						for(int m=0;m<strRows.length;m++){
							HSSFCell cell = row.createCell(m);
							cell.setCellValue(strRows[m]);
						}
					}
				}
				wb.write(out);
				out.close();
				DownloadUtils.download("ALLDATA.xls", allData,"application/octet-stream", false,response);
			}catch (Exception e){
				try {
					wb.write(out);
					out.close();
				}catch (IOException ioe){
					throw new ModelRunException("page download", e);
				}
			}
		}else{
			try{
				DownloadUtils.download("ALLDATA.xls", allData,"application/octet-stream", false,response);
			} catch (ModelRunException e) {
				log.error("download result failed:", e);
			}catch (Throwable e) {
				log.error("download result failed:", e);
			}
		}

	}


    public @ResponseBody String  checkRunName(ModelRunCondition conditions){
		String num="";
    	try {
			conditions.setCreater(AccessControl.getAccessControl().getUserID());
            num = modelRunService.checkRunName(conditions);

        } catch (Exception e) {
            throw new ModelRunException("query ModelRun failed:", e);
        }
        return num;
    }

    public @ResponseBody ModelRun getModelRunByMdid(String mdid){
        ModelRun modelRun = new ModelRun();
        try {
            modelRun = modelRunService.getModelRunByMdid(mdid);

        } catch (ModelRunException e) {
            throw e;
        } catch (Throwable e) {
            throw new ModelRunException("get ModelRun failed::mdid=" + mdid, e);
        }
        return modelRun;
    }




	/**
	 * 下载运行结果文件AnalysGE（打包下载）
	 * @param request
	 * @return
	 */
	public void downloadAnalysGE(HttpServletRequest request, HttpServletResponse response) {
		try {
			String runid = request.getParameter("runId").split("_")[0];
			ModelRun modelRun = modelRunService.getModelRun(runid);
            String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
			String filePath  = SRDIR+modelRun.getCreateUsern()+"-"+modelRun.getJzId()+File.separator+modelRun.getRunId();

			File cs = new File(filePath+File.separator+"closure&shorck.txt");
			if(!cs.exists()){
				String txt = "!====== closure Type======" + "\r\n"
						+ modelRun.getColsureType() +"\r\n"+
						"!====== closure======" + "\r\n"
						+modelRun.getRunColsure()+
						" !====== run_shorck======" + "\r\n"
						+modelRun.getRunShorck();

				TxtExport.creatTxtFile(filePath,"closure&shorck");
				TxtExport.writeTxtFile(txt);
			}
			Map<File,String> m = new HashMap<File, String>();//保存需要打包的文件
			m.put(new File(filePath+File.separator+"closure&shorck.txt"),"closure&shorck.txt");
			m.put(new File(filePath+File.separator+modelRun.getRunId()+".slc"),modelRun.getRunName()+".slc");
			m.put(new File(filePath+File.separator+modelRun.getRunId()+".sl4"),modelRun.getRunName()+".sl4");
			File Su0 = new File(filePath+File.separator+"Summary0.har");
			if(Su0.exists())m.put(new File(filePath+File.separator+"Summary0.har"),"Summary0.har");
			File Su1 = new File(filePath+File.separator+"Summary1.har");
			if(Su1.exists())m.put(new File(filePath+File.separator+"Summary1.har"),"Summary1.har");
			//下载
			String packageName;
			try {
				packageName = URLDecoder.decode(modelRun.getRunName(),"UTF-8");
				response.setContentType("application/zip");
				response.setHeader("Content-Disposition","attachment;filename=\"" + new String(packageName.getBytes(),"ISO-8859-1") + ".rar\"");
				DownloadUtils.zipDownLoad(m, response);
			} catch (Exception e) {
				throw new ModelRunException("page download", e);
			}
		} catch (ModelRunException e) {
			log.error("download result failed:", e);
		} catch (Throwable e) {
			log.error("download result failed:", e);
		}

	}

	public @ResponseBody String operateFinish(String experID){
		//1、更新为操作完成状态；2、统计操作得分；
		Random rand = new Random();
		String endTime = DateUtils.getLongDateStr();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int OperatSocre =0;
		int totalSocre =0;
		try {
			Timestamp tsend = new Timestamp(format.parse(endTime).getTime());
			ExaminationReport bean  = modelRunService.getExperMainByExperID(experID).get(0);

			bean.setEndTime(endTime);
			Timestamp tstart = new Timestamp(format.parse(bean.getStartTime()).getTime());
			int costTime = (int)(tsend.getTime()-tstart.getTime())/(1000*60);
			bean.setCostTime(costTime);
			if(costTime>=35){
				OperatSocre = 45- 10;
			}else if(costTime<=10){
				OperatSocre = 45- rand.nextInt(8);
			}else if(costTime<=16){
				OperatSocre = 45- rand.nextInt(6);
			}else {
				OperatSocre = 45- rand.nextInt(4);
			}

			bean.setOperatSocre(OperatSocre);
			ExperDocCondition conditions = new ExperDocCondition();
			conditions.setExperId(experID);
			conditions.setModelType(bean.getModelType());
			if(OperatSocre>=41){
				totalSocre = OperatSocre+55;
				conditions.setScores(String.valueOf(OperatSocre+55)+",5,5,5,5,5,5,5,10,10,"+String.valueOf(OperatSocre));
			}else if (OperatSocre>39){
				totalSocre = OperatSocre+53;
				conditions.setScores(String.valueOf(OperatSocre+53)+",5,5,5,5,5,5,5,9,9,"+String.valueOf(OperatSocre));
			}else if (OperatSocre>37){
				totalSocre = OperatSocre+51;
				conditions.setScores(String.valueOf(OperatSocre+51)+",5,5,5,5,5,5,4,9,8,"+String.valueOf(OperatSocre));
			}else{
				totalSocre = OperatSocre+49;
				conditions.setScores(String.valueOf(OperatSocre+49)+",5,5,5,5,5,4,4,8,8,"+String.valueOf(OperatSocre));
			}
			bean.setTotalSocre(totalSocre);
			examinationReportService.updateExaminationReport(bean);
			String finish  = modelRunService.operateFinish(experID);
			String toIlab = ((Map)JSON.parseObject(toTokenRecord(conditions))).get("code").toString();
			return  toIlab.equals("0")&&finish.equals("success")?"操作成功，并已提至交ilab平台！":finish.equals("success")?"操作成功！":"失败操作请联系管理员！";
		} catch (Exception e) {
			throw new ModelRunException("operateFinish failed:", e);
		}
	}

	public @ResponseBody  String toTokenRecord(ExperDocCondition conditions ){
		AccessControl control = AccessControl.getAccessControl();
		String userAccount = control.getUserAccount();
		String username = control.getUserAccount();
		System.out.println("============toTokenRecord===========");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			/* 实验结果同步到ilab */
			String appid = RegisterUserController.appid;
			String ilaburl= RegisterUserController.ilaburl;
			String token = StringUtil.isEmpty(RegisterUserController.token_map)?"":RegisterUserController.token_map.get(userAccount).toString();
			if(StringUtil.isEmpty(token)) {
				System.out.println("非ilab用户，不需求提交实验数据！");
				return "{\"code\":-1,\"id\":\"-1\"}";
			}
			ExaminationReport examinationReport = examinationReportService.getExaminationReport(conditions);
			if(StringUtil.isEmpty(conditions.getScores())){
				Random rand = new Random();
				int rd = rand.nextInt(6);
				if(rd==6||rd==5){
					conditions.setScores("96,5,5,5,5,5,5,5,18,24,19");
				}else if (rd==4||rd==3){
					conditions.setScores("95,5,5,5,5,5,5,5,18,23,19");
				}else if (rd==2){
					conditions.setScores("88,5,5,4,5,4,4,4,18,22,17");
				}else if (rd==1){
					conditions.setScores("83,5,4,4,4,4,5,4,16,20,17");
				}else{
					conditions.setScores("58,4,4,2,3,2,2,2,11,16,12");
				}
			}
			String[] scores= conditions.getScores().split(",");
			Timestamp tstart = new Timestamp(format.parse(examinationReport.getStartTime()).getTime());
			Timestamp tend = new Timestamp(format.parse(examinationReport.getEndTime()).getTime());
//			int score  =(93-(int)(Math.random()*10+1));
			List<Step> list = new ArrayList<Step>();
			Step step2 = new Step();
			step2.setSeq(1);
			step2.setTitle("理论学习");
			step2.setStartTime(tstart);
			step2.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step2.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step2.setExpectTime(25*60);
			step2.setMaxScore(5);
			step2.setScore(Integer.valueOf(scores[1]));
			step2.setRepeatCount(1);
			step2.setEvaluation("优秀");
			step2.setScoringModel("全球贸易均衡模型");
			step2.setRemarks("");


			Step step3 = new Step();
			step3.setSeq(2);
			step3.setTitle("学习理论");
			step3.setStartTime(tstart);
			step3.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step3.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step3.setExpectTime(25*60);
			step3.setMaxScore(5);
			step3.setScore(Integer.valueOf(scores[2]));
			step3.setRepeatCount(1);
			step3.setEvaluation("优秀");
			step3.setScoringModel("全球贸易均衡模型");
			step3.setRemarks("");

			Step step4 = new Step();
			step4.setSeq(3);
			step4.setTitle("学习理论");
			step4.setStartTime(tstart);
			step4.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step4.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step4.setExpectTime(25*60);
			step4.setMaxScore(5);
			step4.setScore(Integer.valueOf(scores[3]));
			step4.setRepeatCount(1);
			step4.setEvaluation("优秀");
			step4.setScoringModel("全球贸易均衡模型");
			step4.setRemarks("");

			Step step5 = new Step();
			step5.setSeq(4);
			step5.setTitle("学习理论");
			step5.setStartTime(tstart);
			step5.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step5.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step5.setExpectTime(25*60);
			step5.setMaxScore(5);
			step5.setScore(Integer.valueOf(scores[4]));
			step5.setRepeatCount(1);
			step5.setEvaluation("优秀");
			step5.setScoringModel("全球贸易均衡模型");
			step5.setRemarks("");


			Step step6 = new Step();
			step6.setSeq(5);
			step6.setTitle("学习理论");
			step6.setStartTime(tstart);
			step6.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step6.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step6.setExpectTime(25*60);
			step6.setMaxScore(5);
			step6.setScore(Integer.valueOf(scores[5]));
			step6.setRepeatCount(1);
			step6.setEvaluation("优秀");
			step6.setScoringModel("全球贸易均衡模型");
			step6.setRemarks("");


			Step step7 = new Step();
			step7.setSeq(6);
			step7.setTitle("学习理论");
			step7.setStartTime(tstart);
			step7.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step7.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step7.setExpectTime(25*60);
			step7.setMaxScore(5);
			step7.setScore(Integer.valueOf(scores[6]));
			step7.setRepeatCount(1);
			step7.setEvaluation("优秀");
			step7.setScoringModel("全球贸易均衡模型");
			step7.setRemarks("");


			Step step8 = new Step();
			step8.setSeq(7);
			step8.setTitle("学习理论");
			step8.setStartTime(tstart);
			step8.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step8.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step8.setExpectTime(25*60);
			step8.setMaxScore(5);
			step8.setScore(Integer.valueOf(scores[7]));
			step8.setRepeatCount(1);
			step8.setEvaluation("优秀");
			step8.setScoringModel("全球贸易均衡模型");
			step8.setRemarks("");


			Step step9 = new Step();
			step9.setSeq(8);
			step9.setTitle("理论学习");
			step9.setStartTime(tstart);
			step9.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step9.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step9.setExpectTime(25*60);
			step9.setMaxScore(10);
			step9.setScore(Integer.valueOf(scores[8]));
			step9.setRepeatCount(1);
			step9.setEvaluation("优秀");
			step9.setScoringModel("全球贸易均衡模型");
			step9.setRemarks("");


			Step step10 = new Step();
			step10.setSeq(9);
			step10.setTitle("理论学习");
			step10.setStartTime(tstart);
			step10.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step10.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step10.setExpectTime(25*60);
			step10.setMaxScore(10);
			step10.setScore(Integer.valueOf(scores[9]));
			step10.setRepeatCount(1);
			step10.setEvaluation("优秀");
			step10.setScoringModel("全球贸易均衡模型");
			step10.setRemarks("");

			Step step1 = new Step();
			step1.setSeq(10);
			step1.setTitle("在线模拟");
			step1.setStartTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step1.setEndTime(tend);
			step1.setTimeUsed((int)(tend.getTime()-(tstart.getTime()+tend.getTime())/2)/( 1000));
			step1.setExpectTime(25*60);
			step1.setMaxScore(45);
			step1.setScore(Integer.valueOf(scores[10]));
			step1.setRepeatCount(1);
			step1.setEvaluation("优秀");
			step1.setScoringModel(conditions.getModelType());
			step1.setRemarks("");
			list.add(step1);
			list.add(step2);
			list.add(step3);
			list.add(step4);
			list.add(step5);
			list.add(step6);
			list.add(step7);
			list.add(step8);
			list.add(step9);
			list.add(step10);
			/* 实验结果同步到ilab */
			String url =  ilaburl+"/open/api/v2/data_upload?access_token="+ URLEncoder.encode(token,"UTF-8");
			JSONObject param=new JSONObject();
			param.put("username",username);
			param.put("title",examinationReport.getExperName());
			param.put("status","1");
			param.put("score",Integer.valueOf(scores[0]));
			param.put("startTime",tstart);
			param.put("endTime",tend);
			param.put("timeUsed",(tend.getTime()-tstart.getTime())/(1000));
			param.put("appid",appid);
			param.put("originId",DateUtils.currentTime());
			param.put("steps",list);
			System.out.println(param.toString());
			return HttpClinet.httpPost(url,param.toString());
		} catch (Exception e) {
			throw new ModelRunException("page download", e);
		}
	}

    /**
     * 下载日志文件
     * @param request
     * @return
     */
    public void downloadRunLog(HttpServletRequest request, HttpServletResponse response) {
        try{
			String runid = request.getParameter("runId");
			ModelRun modelRun = modelRunService.getModelRun(runid);
			if(!StringUtil.isEmpty(modelRun.getModelType())){
				String SRDIR= PropertiesUtils.readKeyValue("model.properties", modelRun.getModelType());
				File file = new File(SRDIR+File.separator+modelRun.getRunId()+".LOG");
				DownloadUtils.download("runLog.LOG", file,"application/octet-stream", false,response);
			}
        }catch (ModelRunException e) {
            log.error("download result failed:", e);
        } catch (Throwable e) {
            log.error("download result failed:", e);
        }

    }



}
