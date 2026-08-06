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

import bboss.org.apache.velocity.runtime.directive.Foreach;
import com.common.DateUtils;
import com.frameworkset.platform.admin.service.SmUserService;
import com.pcloud.notification.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import com.pcloud.serialnumber.entity.SerialNumber;
import com.pcloud.serialnumber.service.SerialNumberService;
import org.frameworkset.platform.security.AccessControl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * <p>Title: NotificationServiceImpl</p> <p>Description: 通知公告业务处理类 </p>
 * <p>bxc</p> <p>Copyright (c) 2007</p> @Date 2018-12-13 12:31:18 @author
 * lijia @version v1.0
 */
public class NotificationServiceImpl implements NotificationService {

	private static Logger log = LoggerFactory.getLogger(com.pcloud.notification.service.NotificationServiceImpl.class);
	private ConfigSQLExecutor executor;
	public void addNotification(Notification notification) throws NotificationException {
		TransactionManager tm = new TransactionManager();
		// 业务组件
		try {
			tm.begin();
			executor.insertBean("addNotification", notification);
			executor.insert("addNU",notification.getNotificationId());
			tm.commit();
		} catch (Throwable e) {
			throw new NotificationException("add Notification failed:", e);
		}finally {
			tm.release();
		}

	}
	public void deleteNotification(String notificationId) throws NotificationException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.delete("deleteByKey", notificationId);
			executor.delete("delNU", notificationId);
			tm.commit();
		} catch (Throwable e) {
			throw new NotificationException("delete Notification failed::notificationId=" + notificationId, e);
		}finally {
			tm.release();
		}

	}
	public void deleteBatchNotification(String... notificationIds) throws NotificationException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", notificationIds);
			executor.deleteByKeys("delNU", notificationIds);
			tm.commit();
		} catch (Throwable e) {

			throw new NotificationException("batch delete Notification failed::notificationIds=" + notificationIds, e);
		} finally {
			tm.release();
		}

	}
	public void updateNotification(Notification notification) throws NotificationException {

		try {

			executor.updateBean("updateNotification", notification);

		} catch (Throwable e) {
			throw new NotificationException("update Notification failed::", e);
		}

	}
	public Notification getNotification(String notificationId) throws NotificationException {
		try {
			Notification bean = executor.queryObject(Notification.class, "selectById", notificationId);
			return bean;
		} catch (Throwable e) {
			throw new NotificationException("get Notification failed::notificationId=" + notificationId, e);
		}

	}
	public ListInfo queryListInfoNotifications(NotificationCondition conditions, long offset, int pagesize)
			throws NotificationException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(Notification.class, "queryListNotification", offset, pagesize,
					conditions);
		} catch (Exception e) {
			throw new NotificationException("pagine query Notification failed:", e);
		}
		return datas;

	}
	public List<Notification> queryListNotifications(NotificationCondition conditions) throws NotificationException {
		try {
			List<Notification> beans = executor.queryListBean(Notification.class, "queryListNotification", conditions);
			return beans;
		} catch (Exception e) {
			throw new NotificationException("query Notification failed:", e);
		}

	}

	@Override
	public List<Notification> queryListNotificationsByUserId(String userID) throws NotificationException {
		try {
			List<Notification> beans = executor.queryList(Notification.class,"queryListNotificationsByUserId",userID);
			return beans;
		} catch (Exception e) {
			throw new NotificationException("query Notification failed:", e);
		}
	}

	@Override
	public void delNotificationByUserId(String notificationId) throws NotificationException {
		AccessControl accessControl = AccessControl.getAccessControl();
		try {
			Notification notification = new Notification();
			notification.setNotificationId(notificationId);
			notification.setUserId(accessControl.getUserID());
			executor.updateBean("delNotificationByUserId", notification);

		} catch (Throwable e) {
			throw new NotificationException("update Notification failed::", e);
		}
	}

	@Override
	public void readAllMessgeByUserId() throws NotificationException {
		AccessControl accessControl = AccessControl.getAccessControl();
		try {

			executor.update("readAllMessgeByUserId", accessControl.getUserID());

		} catch (Throwable e) {
			throw new NotificationException("update Notification failed::", e);
		}
	}

	@Override
	public List<Notification> queryListSubscriptionByUserId(String userID) throws NotificationException {
		try {
			List<Notification> beans = executor.queryList(Notification.class,"queryListSubscriptionByUserId",userID);
			return beans;
		} catch (Exception e) {
			throw new NotificationException("query queryListSubscriptionByUserId failed:", e);
		}
	}

	@Override
	public int CountsUnreadMessge(String userID) throws NotificationException {
		int i = 0;
		try {
			List<Notification> beans = executor.queryList(Notification.class,"CountsUnreadMessge",userID);
			if (beans != null) {
				i = beans.size();
			}
			return i;
		} catch (Exception e) {
			throw new NotificationException("query queryListSubscriptionByUserId failed:", e);
		}
	}

	@Override
	public void setReadMessge(String notificationId) throws NotificationException {
		try {

			executor.update("setReadMessge", notificationId);

		} catch (Throwable e) {
			throw new NotificationException("update Notification failed::", e);
		}
	}

	@Override
	public void subscriptionsTask() {

		try {
			List<Notification> beans = executor.queryList(Notification.class,"queryListSubscription",10);
			if (beans != null) {


				for(Notification bean:beans) {
					Notification notification = new Notification();
					notification.setNotificationTitle("订阅信息过期提醒");
					notification.setUserId(bean.getUserId());
					notification.setNotificationState(1);
					notification.setNotificationContent("您订阅的"+bean.getOrderName()+"将于"+bean.getPeriodDay()+"后过期");
					notification.setNotificationId(String.valueOf(System.currentTimeMillis()));
					addNotification(notification);
				}



			}

		} catch (Exception e) {
			throw new NotificationException("query queryListSubscriptionByUserId failed:", e);
		}
	}

	@Override
	public void subscriptionsRemoveRoleTask(SmUserService smUserService, SerialNumberService serialNumberService) throws NotificationException {
		TransactionManager tm = new TransactionManager();
		try {
			List<SerialNumber>  beans = executor.queryList(SerialNumber.class,"subscriptionsRemoveRoleTask",null);
			if (beans != null) {
				tm.begin();
				for(SerialNumber bean:beans) {
					Notification notification = new Notification();
					notification.setNotificationTitle("订阅信息过期提醒");
					notification.setUserId(bean.getUserId());
					notification.setNotificationState(1);
					notification.setNotificationContent("您订阅的["+bean.getOrderName()+"]于"+bean.getValidEndTime()+"过期");
					notification.setNotificationId(String.valueOf(System.currentTimeMillis()));
					notification.setNotificationTime(DateUtils.today());
					addNotification(notification);
					smUserService.deleteRoleUsers(bean.getRoleId(),bean.getUserId(),false); //移除角色
					serialNumberService.setSerialNumberEnd(bean.getSn()); //修改激活码状态

				}

				tm.commit();

			}

		} catch (Exception e) {
			throw new NotificationException("query subscriptionsRemoveRoleTask failed:", e);
		}finally {
			tm.release();
		}

	}
}