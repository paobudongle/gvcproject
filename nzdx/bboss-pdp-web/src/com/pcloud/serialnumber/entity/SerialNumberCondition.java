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

package com.pcloud.serialnumber.entity;

/**
 * <p>Title: SerialNumberCondition</p> <p>Description: 序列号查询条件实体类 </p> <p>xx</p>
 * <p>Copyright (c) 2007</p> @Date 2018-02-23 09:05:22 @author lijia @version
 * v1.0
 */
public class SerialNumberCondition implements java.io.Serializable {
	/**
	 * 序列号
	 */
	private String sn;
	/**
	 * 有效结束时间
	 */
	private String validEndTime;
	/**
	 * 有效开始时间
	 */
	private String validStartTime;

	private String userName;

	private String orderId;

	private String  userId;
	private String  roleId;



	public SerialNumberCondition() {
	}


	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getSn() {
		return sn;
	}

	public void setValidEndTime(String validEndTime) {
		this.validEndTime = validEndTime;
	}

	public String getValidEndTime() {
		return validEndTime;
	}

	public void setValidStartTime(String validStartTime) {
		this.validStartTime = validStartTime;
	}

	public String getValidStartTime() {
		return validStartTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
}