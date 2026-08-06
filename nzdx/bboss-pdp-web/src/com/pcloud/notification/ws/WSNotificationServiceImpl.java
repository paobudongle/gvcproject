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
import com.frameworkset.util.ListInfo;
import java.util.List;
import javax.jws.WebService;

/**
 * <p>Title: WSNotificationServiceImpl</p> <p>Description:
 * 通知公告webservice服务和hessian服务实现类. </p> <p>bxc</p> <p>Copyright (c)
 * 2007</p> @Date 2018-12-13 12:31:18 @author lijia @version v1.0
 */
@WebService(name = "WSNotificationService", targetNamespace = "com.pcloud.notification.ws")
public class WSNotificationServiceImpl implements WSNotificationService {

	private NotificationService notificationService;
	public void addNotification(Notification notification) throws NotificationException {
		// webservice服务
		try {
			notificationService.addNotification(notification);
		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("add Notification failed:", e);
		}

	}
	public void deleteNotification(String notificationId) throws NotificationException {
		// webservice服务
		try {
			notificationService.deleteNotification(notificationId);
		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("delete Notification failed::notificationId=" + notificationId, e);
		}

	}
	public void deleteBatchNotification(String... notificationIds) throws NotificationException {
		// webservice服务
		try {
			notificationService.deleteBatchNotification(notificationIds);
		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("batch delete Notification failed::notificationIds=" + notificationIds, e);
		}

	}
	public void updateNotification(Notification notification) throws NotificationException {
		// webservice服务
		try {
			notificationService.updateNotification(notification);

		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("update Notification failed::", e);
		}

	}
	public Notification getNotification(String notificationId) throws NotificationException {
		// webservice服务
		try {
			Notification notification = notificationService.getNotification(notificationId);
			return notification;
		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("get Notification failed::notificationId=" + notificationId, e);
		}

	}
	public RListInfo queryListInfoNotifications(NotificationCondition conditions, long offset, int pagesize)
			throws NotificationException {
		// webservice服务
		try {

			String notificationTitle = conditions.getNotificationTitle();
			if (notificationTitle != null && !notificationTitle.equals("")) {
				conditions.setNotificationTitle("%" + notificationTitle + "%");
			}
			ListInfo notifications = notificationService.queryListInfoNotifications(conditions, offset, pagesize);
			return new RListInfo(notifications);
		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("pagine query Notification failed:", e);
		}

	}
	public List<Notification> queryListNotifications(NotificationCondition conditions) throws NotificationException {
		// webservice服务
		try {
			String notificationTitle = conditions.getNotificationTitle();
			if (notificationTitle != null && !notificationTitle.equals("")) {
				conditions.setNotificationTitle("%" + notificationTitle + "%");
			}
			List<Notification> notifications = notificationService.queryListNotifications(conditions);
			return notifications;
		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("query Notification failed:", e);
		}

	}
}