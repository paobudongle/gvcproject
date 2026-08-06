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

package com.pcloud.notification.service;

import com.frameworkset.platform.admin.service.SmUserService;
import com.pcloud.notification.entity.*;
import com.frameworkset.util.ListInfo;
import com.pcloud.serialnumber.service.SerialNumberService;

import java.util.List;

/**
 * <p>Title: NotificationService</p> <p>Description: 通知公告服务接口 </p> <p>bxc</p>
 * <p>Copyright (c) 2015</p> @Date 2018-12-13 12:31:18 @author lijia @version
 * v1.0
 */
public interface NotificationService {
	public void addNotification(Notification notification) throws NotificationException;
	public void deleteNotification(String notificationId) throws NotificationException;
	public void deleteBatchNotification(String... notificationIds) throws NotificationException;
	public void updateNotification(Notification notification) throws NotificationException;
	public Notification getNotification(String notificationId) throws NotificationException;
	public ListInfo queryListInfoNotifications(NotificationCondition conditions, long offset, int pagesize)
			throws NotificationException;
	public List<Notification> queryListNotifications(NotificationCondition conditions) throws NotificationException;

	List<Notification> queryListNotificationsByUserId(String userID)throws NotificationException;

	public void delNotificationByUserId(String notificationId)throws NotificationException;

	public void readAllMessgeByUserId() throws NotificationException;

	public List<Notification> queryListSubscriptionByUserId(String userID) throws NotificationException;

    int CountsUnreadMessge(String userID) throws NotificationException;

	void setReadMessge(String notificationId)  throws NotificationException;

    void subscriptionsTask();

    void subscriptionsRemoveRoleTask(SmUserService smUserService, SerialNumberService serialNumberService);
}