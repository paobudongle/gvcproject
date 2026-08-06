
package com.pcloud.examinationreport.action;

import com.alibaba.fastjson.JSONObject;
import com.common.*;
import com.pcloud.examinationreport.entity.*;
import com.frameworkset.util.ListInfo;
import com.pcloud.modeljz.service.JzMainException;
import com.pcloud.modelrun.service.ModelRunException;
import com.pcloud.registeruser.action.RegisterUserController;
import com.pcloud.registeruser.entity.Step;
import org.frameworkset.platform.security.AccessControl;
import org.frameworkset.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.frameworkset.util.StringUtil;
import com.pcloud.examinationreport.service.*;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.frameworkset.util.annotations.PagerParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ExaminationReportController {

	private static Logger log = LoggerFactory.getLogger(ExaminationReportController.class);

	private ExaminationReportService examinationReportService;
	public @ResponseBody String addExaminationReport(ExaminationReport examinationReport) {
		// 控制器
		try {
			examinationReportService.addExaminationReport(examinationReport);
			return "success";
		} catch (ExaminationReportException e) {
			log.error("add ExaminationReport failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add ExaminationReport failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteExaminationReport(String experId) {
		try {
			examinationReportService.deleteExaminationReport(experId);
			return "success";
		} catch (ExaminationReportException e) {
			log.error("delete ExaminationReport failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete ExaminationReport failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchExaminationReport(ExaminationReportCondition reportCondition) {
		try {
			examinationReportService.deleteBatchExaminationReport(reportCondition);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch experIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateExaminationReport(ExaminationReport examinationReport) {
		try {
			examinationReportService.updateExaminationReport(examinationReport);
			return "success";
		} catch (Throwable e) {
			log.error("update ExaminationReport failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getExaminationReport(ExperDocCondition conditions, ModelMap model) throws ExaminationReportException {
		try {

			ExaminationReport examinationReport = examinationReportService.getExaminationReport(conditions);
			ExperDoc experDoc = examinationReportService.queryExperDoc(conditions);
			model.addAttribute("examinationReport", examinationReport);
			model.addAttribute("experDoc", experDoc);

			return "path:getExaminationReport";
		} catch (ExaminationReportException e) {
			throw e;
		} catch (Throwable e) {
			throw new ExaminationReportException("get ExaminationReport failed:", e);
		}

	}
	public String queryListInfoExaminationReports(ExaminationReportCondition conditions,
			@PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws ExaminationReportException {
		try {

			if(UserUtils.isHasRole("students")) {
				conditions.setUserId(AccessControl.getAccessControl().getUserID());
			}

			ListInfo examinationReports = examinationReportService.queryListInfoExaminationReports(conditions, offset, pagesize);


			model.addAttribute("examinationReports", examinationReports);

			return "path:queryListInfoExaminationReports";
		} catch (ExaminationReportException e) {
			throw e;
		} catch (Exception e) {
			throw new ExaminationReportException("pagine query ExaminationReport failed:", e);
		}

	}
	public String queryListExaminationReports(ExaminationReportCondition conditions, ModelMap model)
			throws ExaminationReportException {
		try {
			List<ExaminationReport> examinationReports = examinationReportService.queryListExaminationReports(conditions);
			model.addAttribute("examinationReports", examinationReports);
			return "path:queryListExaminationReports";
		} catch (ExaminationReportException e) {
			throw e;
		} catch (Exception e) {
			throw new ExaminationReportException("query ExaminationReport failed:", e);
		}

	}
	public String toUpdateExaminationReport(String experId, ModelMap model) throws ExaminationReportException {
		try {
			ExaminationReport examinationReport = examinationReportService.getExaminationReport(experId);
			model.addAttribute("examinationReport", examinationReport);
			return "path:updateExaminationReport";
		} catch (ExaminationReportException e) {
			throw e;
		} catch (Throwable e) {
			throw new ExaminationReportException("get ExaminationReport failed::experId=" + experId, e);
		}

	}
	public String toAddExaminationReport() {
		return "path:addExaminationReport";
	}
	public String index(ModelMap model) {


		if(UserUtils.isHasRole("teacher")) {
			model.addAttribute("isTeacher", true);
		}else {
			model.addAttribute("isTeacher", false);
		}

		model.addAttribute("menu_id", 6);
		return "path:index";

	}


	public String toUploadFile(ModelMap model,String experId,String experName,String groupId) throws JzMainException {
		try {
			model.addAttribute("experId", experId);
			model.addAttribute("experName", experName);
			return "path:toUploadFile";
		} catch (JzMainException e) {
			throw e;
		} catch (Throwable e) {
			throw new ExaminationReportException("to JzFile failed", e);
		}

	}


	public @ResponseBody boolean checkUploadFile(ExperDocCondition conditions){
		try {

			ExperDoc experDoc = examinationReportService.queryExperDoc(conditions);
			if(experDoc == null){
				return true;
			}else {
				if("0".equals(conditions.getDocType())) {
					return  experDoc.getPlanDoc() == null;
				}else {
					return  experDoc.getReportDoc() == null;
				}
			}


		} catch (JzMainException e) {
			throw new ExaminationReportException("to checkUploadFile failed", e);
		} catch (Throwable e) {
			throw new ExaminationReportException("to checkUploadFile failed", e);
		}

	}

	public @ResponseBody String uploadFile(MultipartFile file, ExperDoc experDoc,ExperDocCondition conditions,String docType){
		try {
			if(!file.isEmpty()) {
				String suffix = CheckFileFormatUtil.getMultipartFileType(file);
				if(suffix == null) {
					return "上传文件格式只能是doc,docx,pdf!";
				}

				String  useraccount  = AccessControl.getAccessControl().getUserAccount();
				String fileName = file.getOriginalFilename();
				String  docDir = conditions.getExperId()+"/"+conditions.getDocType()+"/";
				String filePath = PropertiesUtils.readKeyValue("model.properties", "DocFile") + docDir;


				conditions.setDocType(null); //只需要判断记录是否存在,不分文件类型
				ExperDoc exist = examinationReportService.queryExperDoc(conditions);


				if(exist == null) {
					if("0".equals(docType)){
						experDoc.setPlanDoc(fileName);
					}else {
						experDoc.setReportDoc(fileName);
					}
					experDoc.setLastModifyer(useraccount);
					experDoc.setLastModifyDate(DateUtils.getReqDate());
					examinationReportService.addExperDoc(experDoc);
				}else {

					if("0".equals(docType)){
						if(exist.getPlanSocre() != 0) {
							return "已评分不能再上传文件!";
						}

						exist.setPlanDoc(fileName);
					}else {

						if(exist.getReportSocre() != 0) {
							return "已评分不能再上传文件!";
						}
						exist.setReportDoc(fileName);
					}
					exist.setLastModifyer(useraccount);
					exist.setLastModifyDate(DateUtils.getReqDate());
					examinationReportService.updateExperDoc(exist);

					// 创建文件
					File dirPath = new File(filePath);
					if (!dirPath.exists()) {
						dirPath.mkdirs();
					}else {
						dirPath.delete();
					}

					file.transferTo(new File(filePath + File.separator +  conditions.getExperId() +"." + suffix));

				}

				return "success";
			} else {
				return "上传文件不能空!";
			}
		} catch (JzMainException e) {
			throw new ExaminationReportException("to uploadFile failed", e);
		} catch (Throwable e) {
			throw new ExaminationReportException("to uploadFile failed", e);
		}

	}

	public String toScore(ExperDocCondition conditions, ModelMap model) throws ExaminationReportException {
		try {
			ExperDoc experDoc = examinationReportService.queryExperDoc(conditions);
			ExaminationReport examinationReport = examinationReportService.getExaminationReport(conditions);
			model.addAttribute("reportDoc", experDoc.getReportDoc());
			model.addAttribute("planDoc", experDoc.getPlanDoc());
			model.addAttribute("experName", examinationReport.getExperName());
			model.addAttribute("costTime", examinationReport.getCostTime());
			model.addAttribute("experId", conditions.getExperId());
			model.addAttribute("planSocre", experDoc.getPlanSocre());
			model.addAttribute("reportSocre", experDoc.getReportSocre());
			return "path:toScore";
		} catch (ExaminationReportException e) {
			throw e;
		} catch (Throwable e) {
			throw new ExaminationReportException("get ExaminationReport failed:" , e);
		}

	}

    public @ResponseBody String isCanScore(ExperDocCondition conditions, ModelMap model) throws ExaminationReportException {
        ExperDoc experDoc = examinationReportService.queryIsExperDoc(conditions);
        if(!StringUtil.isEmpty(experDoc)){
            return "true";
        }else{
            return "false";
        }
    }

	public @ResponseBody String updateScore(ExperDocCondition conditions,Long reportSocre,Long planSocre ) {
		try {
			ExperDoc exist = examinationReportService.queryExperDoc(conditions);
			if (exist != null) {
				String  useraccount  = AccessControl.getAccessControl().getUserAccount();
				exist.setReportSocre(reportSocre);
				exist.setPlanSocre(planSocre);
				exist.setLastModifyer(useraccount);
				exist.setLastModifyDate(DateUtils.getReqDate());
			}
			examinationReportService.updateExperDoc(exist);
			toTokenRecord(conditions);
			return "success";
		} catch (Throwable e) {
			log.error("update ExaminationReport failed:", e);
			return StringUtil.formatBRException(e);
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
				return "";
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
			step9.setTitle("申报书");
			step9.setStartTime(tstart);
			step9.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step9.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step9.setExpectTime(25*60);
			step9.setMaxScore(20);
			step9.setScore(Integer.valueOf(scores[8]));
			step9.setRepeatCount(1);
			step9.setEvaluation("优秀");
			step9.setScoringModel("全球贸易均衡模型");
			step9.setRemarks("老师评分");


			Step step10 = new Step();
			step10.setSeq(10);
			step10.setTitle("实验报告");
			step10.setStartTime(tstart);
			step10.setEndTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step10.setTimeUsed((int)((tstart.getTime()+tend.getTime())/2-tstart.getTime())/(1000));
			step10.setExpectTime(25*60);
			step10.setMaxScore(Integer.valueOf(scores[10]));
			step10.setScore(22);
			step10.setRepeatCount(1);
			step10.setEvaluation("优秀");
			step10.setScoringModel("全球贸易均衡模型");
			step10.setRemarks("老师评分");

			Step step1 = new Step();
			step1.setSeq(9);
			step1.setTitle("在线模拟");
			step1.setStartTime(new Timestamp((tstart.getTime()+tend.getTime())/2));
			step1.setEndTime(tend);
			step1.setTimeUsed((int)(tend.getTime()-(tstart.getTime()+tend.getTime())/2)/( 1000));
			step1.setExpectTime(25*60);
			step1.setMaxScore(20);
			step1.setScore(Integer.valueOf(scores[9]));
			step1.setRepeatCount(1);
			step1.setEvaluation("优秀");
			step1.setScoringModel("全球贸易均衡模型");
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

	public void  downFile(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {


		InputStream is = null;

		OutputStream out = null;

		try {

			String experId = request.getParameter("experId");
			String docType = request.getParameter("docType");
			String docName = request.getParameter("docName");

			String  docDir = experId+"/"+"/"+docType+"/";

			String filePath = PropertiesUtils.readKeyValue("model.properties", "DocFile") + docDir;

			String ctxPath =  filePath + File.separator +  experId  + docName.substring(docName.indexOf("."),docName.length());

			is = new FileInputStream(ctxPath);

			if(is == null)
				return;

			out = response.getOutputStream();

			response.setHeader("Content-Disposition", "attachment; filename=" + new String(docName.getBytes(),"ISO-8859-1"));
			response.setHeader("Accept-Ranges", "bytes");

			int ch = 0;
			while ((ch = is.read()) != -1) {
				out.write(ch);
			}
			out.flush();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try
			{
				if(out != null)
					out.close();
				is.close();
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
	}


}