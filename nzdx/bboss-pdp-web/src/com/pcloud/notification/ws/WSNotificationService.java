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

package com.pcloud.notification.ws;

import com.pcloud.notification.entity.*;
import com.pcloud.notification.service.*;
import com.frameworkset.util.RListInfo;
import java.util.List;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

/**
 * <p>Title: WSNotificationService</p> <p>Description:
 * 通知公告webservice服务和hessian服务接口. </p> <p>bxc</p> <p>Copyright (c) 2015</p> @Date
 * 2018-12-13 12:31:18 @author lijia @version v1.0
 */
@WebService(name = "WSNotificationService", targetNamespace = "com.pcloud.notification.ws")
public interface WSNotificationService {
	public void addNotification(
			@WebParam(name = "notification", partName = "partNotification") Notification notification)
					throws NotificationException;
	public void deleteNotification(
			@WebParam(name = "notificationId", partName = "partNotificationId") String notificationId)
					throws NotificationException;
	public void deleteBatchNotification(
			@WebParam(name = "notificationIds", partName = "partNotificationIds") String... notificationIds)
					throws NotificationException;
	public void updateNotification(
			@WebParam(name = "notification", partName = "partNotification") Notification notification)
					throws NotificationException;
	public @WebResult(name = "notification", partName = "partNotification") Notification getNotification(
			@WebParam(name = "notificationId", partName = "partNotificationId") String notificationId)
					throws NotificationException;
	public @WebResult(name = "notifications", partName = "partNotifications") RListInfo queryListInfoNotifications(
			@WebParam(name = "conditions", partName = "partConditions") NotificationCondition conditions,
			@WebParam(name = "offset", partName = "partOffset") long offset,
			@WebParam(name = "pagesize", partName = "partPagesize") int pagesize) throws NotificationException;
	public @WebResult(name = "notifications", partName = "partNotifications") List<Notification> queryListNotifications(
			@WebParam(name = "conditions", partName = "partConditions") NotificationCondition conditions)
					throws NotificationException;
}