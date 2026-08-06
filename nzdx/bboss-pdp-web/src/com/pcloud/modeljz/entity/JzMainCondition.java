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

package com.pcloud.modeljz.entity;

/**
 * <p>Title: JzMainCondition</p> <p>Description: 模型数据加总查询条件实体类 </p> <p>北京信碧诚</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-25 00:24:45 @author liuwu @version
 * v1.0
 */
public class JzMainCondition implements java.io.Serializable {
	/**
	 * 加总数据名称
	 */
	private String jzTitle;
	/**
	 * 数据状态0:待执行；1:已执行；现阶段实时处理默认为1
	 */
	private int jzStatus;
	/**
	 * 查询开始时间：创建时间
	 */
	private String creatDate_start;
	/**
	 * 查询结束时间：创建时间
	 */
	private String creatDate_end;
	private String sortKey;
	private boolean sortDesc;

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	private String creater;
	public JzMainCondition() {
	}
	public void setJzTitle(String jzTitle) {
		this.jzTitle = jzTitle;
	}

	public String getJzTitle() {
		return jzTitle;
	}

	public void setJzStatus(int jzStatus) {
		this.jzStatus = jzStatus;
	}

	public int getJzStatus() {
		return jzStatus;
	}

	public void setCreatDate_start(String creatDate_start) {
		this.creatDate_start = creatDate_start;
	}

	public String getCreatDate_start() {
		return creatDate_start;
	}
	public void setCreatDate_end(String creatDate_end) {
		this.creatDate_end = creatDate_end;
	}

	public String getCreatDate_end() {
		return creatDate_end;
	}

	public void setSortKey(String sortKey) {
		this.sortKey = sortKey;
	}

	public String getSortKey() {
		return sortKey;
	}

	public void setSortDesc(boolean sortDesc) {
		this.sortDesc = sortDesc;
	}

	public boolean getSortDesc() {
		return sortDesc;
	}

}