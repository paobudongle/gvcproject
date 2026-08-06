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

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: SerialNumber</p> <p>Description: 序列号服务实体类 </p> <p>xx</p>
 * <p>Copyright (c) 2007</p> @Date 2018-02-23 09:05:22 @author lijia @version
 * v1.0
 */
public class SerialNumber implements java.io.Serializable {
	/**
	 * 序列号
	 */
	@PrimaryKey
	private String sn;
	/**
	 * 状态：0:未激活，1:已激活，2:已过期
	 */
	private String activateStatus;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 订单ID
	 */
	private String orderId;
	/**
	 * 用户ID
	 */
	private String userId;
	/**
	 * 有效结束时间
	 */
	private String validEndTime;
	/**
	 * 有效开始时间
	 */
	private String validStartTime;

	private String userName;

	private String activateCode;

	private String orderName;

	private String roleId;

	public SerialNumber() {
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getSn() {
		return sn;
	}

	public void setActivateStatus(String activateStatus) {
		this.activateStatus = activateStatus;
	}

	public String getActivateStatus() {
		return activateStatus;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
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

	public String getActivateCode() {
		return activateCode;
	}

	public void setActivateCode(String activateCode) {
		this.activateCode = activateCode;
	}





}