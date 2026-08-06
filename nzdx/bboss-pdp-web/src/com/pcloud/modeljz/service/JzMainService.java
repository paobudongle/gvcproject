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

package com.pcloud.modeljz.service;

import com.frameworkset.util.ListInfo;
import com.pcloud.modeljz.entity.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.frameworkset.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface JzMainService {
	public void addJzMain(JzMain jzMain) throws JzMainException;
	public void deleteJzMain(String jzId) throws JzMainException;
	public void deleteBatchJzMain(String... jzIds) throws JzMainException;
	public void updateJzMain(JzMain jzMain) throws JzMainException;
	public JzMain getJzMain(String jzId) throws JzMainException;
	public ListInfo queryListInfoJzMains(JzMainCondition conditions, long offset, int pagesize) throws JzMainException;
	public List<JzMain> queryListJzMains(JzMainCondition conditions) throws JzMainException;
	public List<JzDf> queryListJzDf(int type,String mdid) throws JzMainException;
	public void updateJzDf(JzDf jzDf) throws JzMainException;
	public List<JzBasic> queryListJzBasic(int i) throws JzMainException;

	public  List<JzDf> queryListJzDf() throws JzMainException;
	public void executeJZ()throws JzMainException;


	public List<JzAreaIndus> queryListJzAreaIndus(int type,String mdid);
	public void crateInputText(String mdid);
	public Map<String,String> executeCMD(String rundir,String command, String inputTxtName);

	public void addJzDf(JzDf jzDf);
	public void addJzAreaIndus(List<JzAreaIndus> list);

	/**
	 * 模型冲击
	 * @return
	 */
	public List<Mshorck> queryListMshorck() throws JzMainException;

	public  void creatCMF(String colsure, String shorck);

	public JzDf getJzDfById(String id);

	public void deleteJzDfById(String dfId);

	public List<String> getYearMouth();

	public List<JzMain> querySymbJzMain();
    public List<JzDf> getSymbJzDf(String miId,String type);
    public List<JzAreaIndus>getSymbJz(String miId,String type);

	public void  deleteJzdfByMdId(String miId,String type);

	public void  deleteJzdfByMdIdOnly(String miId);
	//删除原来重新归类数据
	public void   deleteJzDetailByMdId(String miId,String type);

	public void batchAddJzDf(List<JzDf> list);

	public List<JzDf> queryListJzDfAll(String mdid) throws JzMainException;

	public List<JzAreaIndus> queryListJzAreaIndusAll(String mdid);

	public void deleteModelRun(String mdId) throws JzMainException;

    public int  checkJzName(String name);

    public JzMain getJzMainByMdId(String mdId) throws JzMainException;

    void addAggExcel(MultipartFile file) throws Exception;

	Map<String, Object> addCaseExcel(MultipartFile file)  throws Exception ;

	XSSFWorkbook expAggExcel(String jzId) throws Exception ;

	void updateJzTitle(JzMain jzMain) throws Exception ;
}