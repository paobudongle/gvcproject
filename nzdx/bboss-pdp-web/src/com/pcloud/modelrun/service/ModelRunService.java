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

import com.pcloud.examinationreport.entity.ExaminationReport;
import com.pcloud.modeljz.entity.JsTree;
import com.pcloud.modeljz.entity.JzMain;
import com.pcloud.modeljz.entity.Mshorck;
import com.pcloud.modelrun.entity.*;
import com.frameworkset.util.ListInfo;
import java.util.List;

/**
 * <p>Title: ModelRunService</p> <p>Description: 模型运行服务接口 </p> <p>jbxbckj</p>
 * <p>Copyright (c) 2015</p> @Date 2018-05-17 16:31:44 @author lw @version v1.0
 */
public interface ModelRunService {
	public void addModelRun(ModelRun modelRun) throws ModelRunException;
	public void deleteModelRun(String runId) throws ModelRunException;
	public void deleteBatchModelRun(String... runIds) throws ModelRunException;
	public void updateModelRun(ModelRun modelRun) throws ModelRunException;
	public ModelRun getModelRun(String runId) throws ModelRunException;
	public ListInfo queryListInfoModelRuns(ModelRunCondition conditions, long offset, int pagesize)
			throws ModelRunException;
	public List<ModelRun> queryListModelRuns(ModelRunCondition conditions) throws ModelRunException;

	public List<Mshorck> queryListMshorck() throws ModelRunException;

	public  ModelRun creatCMF(String basedir,String colsure, String shorck, String runname,String remark,String colsureType,String experID);

	public void creatRunBat(ModelRun modelrun,String basepath,String jzUserName)throws Exception ;

	public List<JzMain> queryJZList();

	public List<JzMain> queryJZListWithYM(String yearMouth);

    List<JsTree> refSimulateTree(ModelRunCondition conditions);

	public String  checkRunName(ModelRunCondition conditions);

	JsTree	getVariableById(String paramID);

	public ModelRun  getModelRunByMdid(String mdid);

	public List<ModelRun> getAggModelRunNo(String jzId);

	String operateFinish(String pairId);

	List<ExaminationReport> getExperMainByExperID(String experID);
}