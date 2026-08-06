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

package com.pcloud.meeting.action;

import com.pcloud.meeting.entity.*;
import com.frameworkset.util.ListInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import java.util.Map;
import com.frameworkset.util.StringUtil;
import com.pcloud.meeting.service.*;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.MapKey;

/**
 * <p>Title: MeetingController</p> <p>Description: 会议管理控制器处理类 </p> <p>bc</p>
 * <p>Copyright (c) 2007</p> @Date 2018-05-19 12:04:43 @author lijia @version
 * v1.0
 */
public class MeetingController {

	private static Logger log = LoggerFactory.getLogger(MeetingController.class);

	private MeetingService meetingService;
	public @ResponseBody String addMeeting(Meeting meeting) {
		// 控制器
		try {
			meetingService.addMeeting(meeting);
			return "success";
		} catch (MeetingException e) {
			log.error("add Meeting failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add Meeting failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteMeeting(String meetingId) {
		try {
			meetingService.deleteMeeting(meetingId);
			return "success";
		} catch (MeetingException e) {
			log.error("delete Meeting failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete Meeting failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchMeeting(String... meetingIds) {
		try {
			meetingService.deleteBatchMeeting(meetingIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch meetingIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateMeeting(Meeting meeting) {
		try {
			meetingService.updateMeeting(meeting);
			return "success";
		} catch (Throwable e) {
			log.error("update Meeting failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getMeeting(String meetingId, ModelMap model) throws MeetingException {
		try {
			Meeting meeting = meetingService.getMeeting(meetingId);
			model.addAttribute("meeting", meeting);
			return "path:getMeeting";
		} catch (MeetingException e) {
			throw e;
		} catch (Throwable e) {
			throw new MeetingException("get Meeting failed::meetingId=" + meetingId, e);
		}

	}
	public String queryListInfoMeetings(MeetingCondition conditions, @PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws MeetingException {
		// Constant.component_type_actionimpl
		try {
			String meetingAddress = conditions.getMeetingAddress();
			if (meetingAddress != null && !meetingAddress.equals("")) {
				conditions.setMeetingAddress("%" + meetingAddress + "%");
			}
			String title = conditions.getTitle();
			if (title != null && !title.equals("")) {
				conditions.setTitle("%" + title + "%");
			}

			ListInfo meetings = meetingService.queryListInfoMeetings(conditions, offset, pagesize);
			model.addAttribute("meetings", meetings);
			return "path:queryListInfoMeetings";
		} catch (MeetingException e) {
			throw e;
		} catch (Exception e) {
			throw new MeetingException("pagine query Meeting failed:", e);
		}

	}
	public String queryListMeetings(MeetingCondition conditions, ModelMap model) throws MeetingException {
		try {
			String meetingAddress = conditions.getMeetingAddress();
			if (meetingAddress != null && !meetingAddress.equals("")) {
				conditions.setMeetingAddress("%" + meetingAddress + "%");
			}
			String title = conditions.getTitle();
			if (title != null && !title.equals("")) {
				conditions.setTitle("%" + title + "%");
			}
			List<Meeting> meetings = meetingService.queryListMeetings(conditions);
			model.addAttribute("meetings", meetings);
			return "path:queryListMeetings";
		} catch (MeetingException e) {
			throw e;
		} catch (Exception e) {
			throw new MeetingException("query Meeting failed:", e);
		}

	}
	public String toUpdateMeeting(String meetingId, ModelMap model) throws MeetingException {
		try {
			Meeting meeting = meetingService.getMeeting(meetingId);
			model.addAttribute("meeting", meeting);
			return "path:updateMeeting";
		} catch (MeetingException e) {
			throw e;
		} catch (Throwable e) {
			throw new MeetingException("get Meeting failed::meetingId=" + meetingId, e);
		}

	}
	public String toAddMeeting() {
		return "path:addMeeting";
	}
	public String index() {
		return "path:index";

	}
}