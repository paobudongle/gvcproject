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

package com.pcloud.modelrun.service;

import com.common.DateUtils;
import com.common.StringUtils;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.frameworkset.orm.transaction.TransactionManager;
import com.frameworkset.util.ListInfo;
import com.pcloud.examinationreport.entity.ExaminationReport;
import com.pcloud.modeljz.entity.JsTree;
import com.pcloud.modeljz.entity.JzMain;
import com.pcloud.modeljz.entity.Mshorck;
import com.pcloud.modelrun.entity.ModelRun;
import com.pcloud.modelrun.entity.ModelRunCondition;
import org.frameworkset.platform.security.AccessControl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

/**
 * <p>Title: ModelRunServiceImpl</p> <p>Description: 模型运行业务处理类 </p>
 * <p>jbxbckj</p> <p>Copyright (c) 2007</p> @Date 2018-05-17 16:31:44 @author
 * lw @version v1.0
 */
public class ModelRunServiceImpl implements ModelRunService {

	private static Logger log = LoggerFactory.getLogger(ModelRunServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addModelRun(ModelRun modelRun) throws ModelRunException {
		// 业务组件
		try {
			executor.insertBean("addModelRun", modelRun);
		} catch (Throwable e) {
			throw new ModelRunException("add ModelRun failed:", e);
		}

	}
	public void deleteModelRun(String runId) throws ModelRunException {
		try {
			executor.delete( "deleteByKey", runId);
		} catch (Throwable e) {
			throw new ModelRunException("delete ModelRun failed::runId=" + runId, e);
		}

	}
	public void deleteBatchModelRun(String... runIds) throws ModelRunException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", runIds);
			tm.commit();
		} catch (Throwable e) {

			throw new ModelRunException("batch delete ModelRun failed::runIds=" + runIds, e);
		} finally {
			tm.release();
		}

	}
	public void updateModelRun(ModelRun modelRun) throws ModelRunException {
		try {
			executor.updateBean( "updateModelRun", modelRun);
		} catch (Throwable e) {
			throw new ModelRunException("update ModelRun failed::", e);
		}

	}
	public ModelRun getModelRun(String runId) throws ModelRunException {
		try {
			ModelRun bean = executor.queryObject(ModelRun.class, "selectById", runId);
			return bean;
		} catch (Throwable e) {
			throw new ModelRunException("get ModelRun failed::runId=" + runId, e);
		}

	}

	public ListInfo queryListInfoModelRuns(ModelRunCondition conditions, long offset, int pagesize)
			throws ModelRunException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(ModelRun.class, "queryListModelRun", offset, pagesize,
					conditions);
		} catch (Exception e) {
			throw new ModelRunException("pagine query ModelRun failed:", e);
		}
		return datas;

	}
	public List<ModelRun> queryListModelRuns(ModelRunCondition conditions) throws ModelRunException {
		try {
			List<ModelRun> beans = executor.queryListBean(ModelRun.class, "queryListModelRun",
					conditions);
			return beans;
		} catch (Exception e) {
			throw new ModelRunException("query ModelRun failed:", e);
		}

	}

	@Override
	public List<Mshorck> queryListMshorck() throws ModelRunException {
		try {
			List<Mshorck> shorckList = executor.queryList(Mshorck.class,"queryListShorck");
			return shorckList;
		}catch (SQLException e){
			throw new ModelRunException("Batch  add JzAreaIndus failed:", e);
		}

	}

	public ModelRun creatCMF(String basepath,String colsure, String shorck,String runname,String remark,String colsureType,String experID) {
		String userAccount  =AccessControl.getAccessControl().getUserAccount();
		ModelRun modelRun = new ModelRun();
		modelRun.setRunName(runname);
		modelRun.setCreatDate(DateUtils.getLongDateStr());
		modelRun.setLastModifyDate(DateUtils.getLongDateStr());
		modelRun.setCreateUsern(userAccount);
		modelRun.setCreater(AccessControl.getAccessControl().getUserID());
		modelRun.setLastModifyer(AccessControl.getAccessControl().getUserID());
		modelRun.setRunColsure(colsure);
		modelRun.setRunShorck(shorck);
		modelRun.setRunStatus("0");
        modelRun.setColsureType(colsureType);
        modelRun.setExperId(experID);
		modelRun.setRemark(remark);
		try{

			executor.insertBean("addModelRun", modelRun);
			//读取基础文件
			//读取基础文件
			BufferedReader br = new BufferedReader(new FileReader(new File(basepath+File.separator+"txt1_ModeSet.txt")));
			StringBuffer sb = new StringBuffer();
			String str = null;
			while((str=br.readLine()) != null){//一行一行读，如果不为空，继续运行
                if(str.indexOf("{run_result_dir}")!=-1){
                    str=str.replace("{run_result_dir}",  modelRun.getRunId());
                }
				sb.append(str+"\r\n");
			}
			if(StringUtils.isNotEmpty(colsure)){
				sb.append(colsure);
			}
			if(StringUtils.isNotEmpty(shorck)){
				sb.append(shorck);
			}
			br.close();//关闭输入流
			PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(basepath+File.separator+modelRun.getRunId()+".cmf")));
			out.write(sb.toString());//把sb里面的内容读入test.cmf中
			out.flush();
			out.close();
			return modelRun;
		}catch (Throwable e) {
			throw new ModelRunException("add ModelRun failed:", e);
		}
	}

	public void creatRunBat(ModelRun modelrun,String basepath,String jzUserName)throws Exception{
		BufferedReader br = new BufferedReader(new FileReader(new File(basepath+ "run_Stand.bat")));
		StringBuffer sb = new StringBuffer();
		String str = null;
		while ((str = br.readLine()) != null) {//一行一行读，如果不为空，继续运行
			if (str.indexOf("{run_result_dir}") != -1) {
				str = str.replace("{run_result_dir}", modelrun.getRunId());
			}
			sb.append(str + "\r\n");
		}
		br.close();//关闭输入流
		PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(basepath + modelrun.getRunId() + ".bat")));
		out.write(sb.toString());
		out.flush();
		out.close();
	}

	@Override
	public List<JzMain> queryJZList() {
		try {
			List<JzMain> jzList = executor.queryList(JzMain.class,"queryJZList",AccessControl.getAccessControl().getUserID());
			return jzList;
		}catch (SQLException e){
			throw new ModelRunException("query queryJZList failed:", e);
		}
	}

	@Override
	public List<JzMain> queryJZListWithYM(String yearMouth) {
		try {
			List<JzMain> jzList = executor.queryList(JzMain.class,"queryJZListWithYM",yearMouth,AccessControl.getAccessControl().getUserID());
			return jzList;
		}catch (SQLException e){
			throw new ModelRunException("query queryJZListWithYM failed:", e);
		}
	}

	@Override
	public List<JsTree> refSimulateTree(ModelRunCondition conditions) {

		try {
			List<JsTree> beans = null;
			String id = conditions.getId();
			String pId = "00";

			if("".equals(id)){
				beans = executor.queryListBean(JsTree.class, "refSimulateTree", conditions);
			}else {
				if(!"".equals(conditions.getParent())) {
					pId = id.split("_")[1];
				}


				beans = getJsTreeChildren(pId,id.split("_")[0]);
			}



			return beans;
		}catch (SQLException e){
			throw new ModelRunException("query refSimulateTree failed:", e);
		}

	}

	@Override
	public String checkRunName(ModelRunCondition conditions) {
		try {
            List<ModelRun> list =  executor.queryList(ModelRun.class,"checkRunName",conditions.getCreater(),conditions.getRunName());
			return String.valueOf(list.size());
		}catch (SQLException e){
			throw new ModelRunException("checkRunName failed:", e);
		}
	}

	public List<JsTree> getJsTreeChildren(String pId,String rootId) {

		try {

			List<JsTree> beans = executor.queryList(JsTree.class, "getJsTreeChildren", pId);
			for(JsTree bean:beans) {
				String id = bean.getId();
				bean.setId(rootId +"_"+id);
			}


			return beans;
		}catch (SQLException e){
			throw new ModelRunException("query queryJZListWithYM failed:", e);
		}
	}

	public JsTree  getVariableById(String paramID){
	    try {
            List<JsTree> list = executor.queryList(JsTree.class, "getVariableById", paramID);
            if (list.size()>0){
                return list.get(0);
            }else{
                return null;
            }
        }catch (SQLException e){
            throw new ModelRunException("query queryJZListWithYM failed:", e);
        }
    }

	public ModelRun  getModelRunByMdid (String mdid){
		try {
			List<ModelRun> list = executor.queryList(ModelRun.class, "getModelRunByMdid", mdid);
			if (list.size()>0){
				return list.get(0);
			}else{
				return null;
			}
		}catch (SQLException e){
			throw new ModelRunException("query queryJZListWithYM failed:", e);
		}

	}

	@Override
	public List<ModelRun> getAggModelRunNo(String jzId) {
		try {
			List<ModelRun> list = executor.queryList(ModelRun.class, "getModelRunByMdid", jzId);
			return list;
		}catch (SQLException e){
			throw new ModelRunException("get  AggModelRunNo failed:", e);
		}
	}

	@Override
	public String operateFinish(String pairId) {
		try {
			executor.update("operateFinish", pairId);
			return  "success";
		} catch (Throwable e) {
			throw new ModelRunException("operateFinish failed::", e);
		}
	}
	@Override
	public List<ExaminationReport> getExperMainByExperID(String pairId) {
		try {
			List<ExaminationReport> list = executor.queryList(ExaminationReport.class, "getExperMainByExperID", pairId);
			return list;
		}catch (SQLException e){
			throw new ModelRunException("get getExperMainByExperID failed:", e);
		}
	}
}
