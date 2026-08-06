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

package com.pcloud.advertise.entity;

/**
 * <p>Title: AdvertiseCondition</p> <p>Description: 招聘查询条件实体类 </p> <p>bc</p>
 * <p>Copyright (c) 2007</p> @Date 2018-05-19 12:05:28 @author lijia @version
 * v1.0
 */
public class AdvertiseCondition implements java.io.Serializable {
	/**
	 * 招聘职位
	 */
	private String advertisePosition;
	/**
	 * 工作地点
	 */
	private String workAddress;
	/**
	 * 状态0，未发布，1已发布
	 */
	private String advertiseStatus;

	private String searchword;


	public AdvertiseCondition() {
	}

	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	public void setAdvertisePosition(String advertisePosition) {
		this.advertisePosition = advertisePosition;
	}

	public String getAdvertisePosition() {
		return advertisePosition;
	}

	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}

	public String getWorkAddress() {
		return workAddress;
	}

	public String getAdvertiseStatus() {
		return advertiseStatus;
	}

	public void setAdvertiseStatus(String advertiseStatus) {
		this.advertiseStatus = advertiseStatus;
	}
}