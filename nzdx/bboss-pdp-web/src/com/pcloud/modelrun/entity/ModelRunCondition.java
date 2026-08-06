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

package com.pcloud.modelrun.entity;

/**
 * <p>Title: ModelRunCondition</p> <p>Description: 模型运行查询条件实体类 </p>
 * <p>jbxbckj</p> <p>Copyright (c) 2007</p> @Date 2018-05-17 16:31:44 @author
 * lw @version v1.0
 */
public class ModelRunCondition implements java.io.Serializable {
	/**
	 * 0:处室创建；1：数据加总；2：运行完成
	 */
	private String runStatus;

	public String getRunName() {
		return runName;
	}

	public void setRunName(String runName) {
		this.runName = runName;
	}

	private String runName;
	private String sortKey;

	private String id;
	private String parent;

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	private String  creater;
	private boolean sortDesc;

	private String  experId;

	public String getExperId() {
		return experId;
	}

	public void setExperId(String experId) {
		this.experId = experId;
	}

	public ModelRunCondition() {
	}
	public void setRunStatus(String runStatus) {
		this.runStatus = runStatus;
	}

	public String getRunStatus() {
		return runStatus;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public boolean isSortDesc() {
		return sortDesc;
	}
}