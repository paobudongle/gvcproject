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

/**
 * <p>Title: NotificationCondition</p> <p>Description: 通知公告查询条件实体类 </p>
 * <p>bxc</p> <p>Copyright (c) 2007</p> @Date 2018-12-13 12:31:18 @author
 * lijia @version v1.0
 */
public class NotificationCondition implements java.io.Serializable {
	/**
	 * 通知标题
	 */
	private String notificationTitle;
	public NotificationCondition() {
	}
	public void setNotificationTitle(String notificationTitle) {
		this.notificationTitle = notificationTitle;
	}

	public String getNotificationTitle() {
		return notificationTitle;
	}

}