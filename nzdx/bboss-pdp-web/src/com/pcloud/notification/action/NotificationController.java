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

package com.pcloud.notification.action;

import com.fivestars.interfaces.bbs.client.Client;
import com.frameworkset.platform.admin.entity.SmUser;
import com.frameworkset.platform.admin.service.SmUserException;
import com.frameworkset.platform.admin.service.SmUserService;
import com.pcloud.notification.entity.*;
import com.frameworkset.util.ListInfo;
import com.pcloud.serialnumber.service.SerialNumberService;
import org.frameworkset.platform.security.AccessControl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.Map;
import com.frameworkset.util.StringUtil;
import com.pcloud.notification.service.*;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.MapKey;

/**
 * <p>Title: NotificationController</p> <p>Description: 通知公告控制器处理类 </p>
 * <p>bxc</p> <p>Copyright (c) 2007</p> @Date 2018-12-13 12:31:18 @author
 * lijia @version v1.0
 */
public class NotificationController {

	private static Logger log = LoggerFactory.getLogger(NotificationController.class);

	private NotificationService notificationService;
	private SmUserService smUserService;
	private SerialNumberService serialNumberService;

	public @ResponseBody String addNotification(Notification notification) {
		// 控制器
		try {
			notification.setNotificationId(String.valueOf(System.currentTimeMillis()));
			notificationService.addNotification(notification);
			return "success";
		} catch (NotificationException e) {
			log.error("add Notification failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add Notification failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteNotification(String notificationId) {
		try {
			notificationService.deleteNotification(notificationId);
			return "success";
		} catch (NotificationException e) {
			log.error("delete Notification failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete Notification failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchNotification(String... notificationIds) {
		try {
			notificationService.deleteBatchNotification(notificationIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch notificationIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateNotification(Notification notification) {
		try {
			notificationService.updateNotification(notification);
			return "success";
		} catch (Throwable e) {
			log.error("update Notification failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getNotification(String notificationId, ModelMap model) throws NotificationException {
		try {
			Notification notification = notificationService.getNotification(notificationId);
			model.addAttribute("notification", notification);
			return "path:getNotification";
		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("get Notification failed::notificationId=" + notificationId, e);
		}

	}
	public String queryListInfoNotifications(NotificationCondition conditions,
			@PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws NotificationException {
		// Constant.component_type_actionimpl
		try {
			String notificationTitle = conditions.getNotificationTitle();
			if (notificationTitle != null && !notificationTitle.equals("")) {
				conditions.setNotificationTitle("%" + notificationTitle + "%");
			}

			ListInfo notifications = notificationService.queryListInfoNotifications(conditions, offset, pagesize);
			model.addAttribute("notifications", notifications);
			return "path:queryListInfoNotifications";
		} catch (NotificationException e) {
			throw e;
		} catch (Exception e) {
			throw new NotificationException("pagine query Notification failed:", e);
		}

	}
	public String queryListNotifications(NotificationCondition conditions, ModelMap model)
			throws NotificationException {
		try {
			String notificationTitle = conditions.getNotificationTitle();
			if (notificationTitle != null && !notificationTitle.equals("")) {
				conditions.setNotificationTitle("%" + notificationTitle + "%");
			}
			List<Notification> notifications = notificationService.queryListNotifications(conditions);
			model.addAttribute("notifications", notifications);
			return "path:queryListNotifications";
		} catch (NotificationException e) {
			throw e;
		} catch (Exception e) {
			throw new NotificationException("query Notification failed:", e);
		}

	}
	public String toUpdateNotification(String notificationId, ModelMap model) throws NotificationException {
		try {
			Notification notification = notificationService.getNotification(notificationId);
			model.addAttribute("notification", notification);
			return "path:updateNotification";
		} catch (NotificationException e) {
			throw e;
		} catch (Throwable e) {
			throw new NotificationException("get Notification failed::notificationId=" + notificationId, e);
		}

	}
	public String toAddNotification() {
		return "path:addNotification";
	}
	public String index() {
		return "path:index";

	}

	public String toNotificationindex(String type,ModelMap model) {
		AccessControl accessControl = AccessControl.getAccessControl();
		List<Notification> notifications = notificationService.queryListNotificationsByUserId(accessControl.getUserID());
		List<Notification> subscriptions = notificationService.queryListSubscriptionByUserId(accessControl.getUserID());
		model.addAttribute("notifications", notifications);
		model.addAttribute("subscriptions", subscriptions);

		SmUser smUser = smUserService.getSmUser(accessControl.getUserID());

		model.addAttribute("userMobiletel", smUser.getUserMobiletel1());
		model.addAttribute("userEmail", smUser.getUserEmail());


		model.addAttribute("menu_id", 8);
		model.addAttribute("type", type);
		return "path:toNotificationindex";

	}

	public @ResponseBody String delNotificationByUserId(String notificationId) {
		try {
			notificationService.delNotificationByUserId(notificationId);


			return "success";
		} catch (Throwable e) {
			log.error("delete Batch notificationIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String readAllMessge() {
		try {
			notificationService.readAllMessgeByUserId();
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch notificationIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}

	public @ResponseBody String setReadMessge(String notificationId) {
		try {
			notificationService.setReadMessge(notificationId);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch notificationIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}

	public @ResponseBody int CountsUnreadMessge() {
		try {
			AccessControl accessControl = AccessControl.getAccessControl();
			int notifications = notificationService.CountsUnreadMessge(accessControl.getUserID());
			return notifications;
		} catch (Throwable e) {
			log.error("delete Batch notificationIds failed:", e);
			return 0;
		}

	}


	public @ResponseBody String updateUser(String userEmail,String userMobiletel1,String newPassword,String newPasswordSecond,String oldPassword,String type){
		AccessControl accessControl = AccessControl.getAccessControl();
		String userId = accessControl.getUserID();

		String flag = "success";

		SmUser smUser = smUserService.getSmUser(userId);
		smUser.setUserEmail(userEmail);
		smUser.setUserMobiletel1(userMobiletel1);
		smUserService.updateSmUser(smUser);





		if("1".equals(type)){


			String currentUserId = AccessControl.getAccessControl().getUserID();
			if(currentUserId.equals(userId) || AccessControl.getAccessControl().checkPermission("orgunit", "modifypassword","orgunit"))//判断用户是否有重置密码的权限
			{
				/*Client uc = new Client();
				String  $ucresult = uc.uc_user_edit(smUser.getUserName(), oldPassword, newPasswordSecond, userEmail, 0, null, null);
				if($ucresult == "-1") {
					flag = "旧密码不正确";
				} else if($ucresult == "-4") {
					flag = "Email 格式有误";
				} else if($ucresult == "-5") {
				    flag = "Email 不允许注册";
				} else if($ucresult == "-6") {
					flag = "该 Email 已经被注册";
				}*/
				return smUserService.modifypassword(userId,  newPassword,  newPasswordSecond,  oldPassword);
			}
			else
			{
				flag = "无权修改用户口令!";
			}
		}

			return flag;

	}

	/**
	 *小于10天过期提醒
	 */
	public  void subscriptionsTask() {
		notificationService.subscriptionsTask();


	}

	/**
	 * 过期，移除角色
	 */
	public  void subscriptionsRemoveRoleTask() {
		notificationService.subscriptionsRemoveRoleTask(smUserService,serialNumberService);


	}





}