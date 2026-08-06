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

package com.pcloud.notification.entity;

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: Notification</p> <p>Description: 通知公告服务实体类 </p> <p>bxc</p>
 * <p>Copyright (c) 2007</p> @Date 2018-12-13 12:31:18 @author lijia @version
 * v1.0
 */
public class Notification implements java.io.Serializable {
	/**
	 * 通知ID
	 */

	private String notificationId;
	/**
	 * 通知内容
	 */
	private String notificationContent;
	/**
	 * 0,未发布，1已发布
	 */
	private int notificationState;
	/**
	 * 通知时间
	 */
	private String notificationTime;
	/**
	 * 通知标题
	 */
	private String notificationTitle;
	private String readState;
	private String userId;


	private String periodDay;
	/**
	 * 有效结束时间
	 */
	private String validEndTime;
	/**
	 * 有效开始时间
	 */
	private String validStartTime;

	private String orderName;


	public Notification() {
	}
	public void setNotificationId(String notificationId) {
		this.notificationId = notificationId;
	}

	public String getNotificationId() {
		return notificationId;
	}

	public void setNotificationContent(String notificationContent) {
		this.notificationContent = notificationContent;
	}

	public String getNotificationContent() {
		return notificationContent;
	}

	public void setNotificationState(int notificationState) {
		this.notificationState = notificationState;
	}

	public int getNotificationState() {
		return notificationState;
	}

	public void setNotificationTime(String notificationTime) {
		this.notificationTime = notificationTime;
	}

	public String getNotificationTime() {
		return notificationTime;
	}

	public void setNotificationTitle(String notificationTitle) {
		this.notificationTitle = notificationTitle;
	}

	public String getNotificationTitle() {
		return notificationTitle;
	}

	public String getReadState() {
		return readState;
	}

	public void setReadState(String readState) {
		this.readState = readState;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPeriodDay() {
		return periodDay;
	}

	public void setPeriodDay(String periodDay) {
		this.periodDay = periodDay;
	}

	public String getValidEndTime() {
		return validEndTime;
	}

	public void setValidEndTime(String validEndTime) {
		this.validEndTime = validEndTime;
	}

	public String getValidStartTime() {
		return validStartTime;
	}

	public void setValidStartTime(String validStartTime) {
		this.validStartTime = validStartTime;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}


}