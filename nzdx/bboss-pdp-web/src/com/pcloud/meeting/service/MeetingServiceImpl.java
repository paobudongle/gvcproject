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

package com.pcloud.meeting.service;

import com.pcloud.meeting.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * <p>Title: MeetingServiceImpl</p> <p>Description: 会议管理业务处理类 </p> <p>bc</p>
 * <p>Copyright (c) 2007</p> @Date 2018-05-19 12:04:43 @author lijia @version
 * v1.0
 */
public class MeetingServiceImpl implements MeetingService {

	private static Logger log = LoggerFactory.getLogger(MeetingServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addMeeting(Meeting meeting) throws MeetingException {
		// 业务组件
		try {
			executor.insertBean("addMeeting", meeting);
		} catch (Throwable e) {
			throw new MeetingException("add Meeting failed:", e);
		}

	}
	public void deleteMeeting(String meetingId) throws MeetingException {
		try {
			executor.delete("deleteByKey", meetingId);
		} catch (Throwable e) {
			throw new MeetingException("delete Meeting failed::meetingId=" + meetingId, e);
		}

	}
	public void deleteBatchMeeting(String... meetingIds) throws MeetingException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", meetingIds);
			tm.commit();
		} catch (Throwable e) {

			throw new MeetingException("batch delete Meeting failed::meetingIds=" + meetingIds, e);
		} finally {
			tm.release();
		}

	}
	public void updateMeeting(Meeting meeting) throws MeetingException {
		try {
			executor.updateBean("updateMeeting", meeting);
		} catch (Throwable e) {
			throw new MeetingException("update Meeting failed::", e);
		}

	}
	public Meeting getMeeting(String meetingId) throws MeetingException {
		try {
			Meeting bean = executor.queryObject(Meeting.class, "selectById", meetingId);
			return bean;
		} catch (Throwable e) {
			throw new MeetingException("get Meeting failed::meetingId=" + meetingId, e);
		}

	}
	public ListInfo queryListInfoMeetings(MeetingCondition conditions, long offset, int pagesize)
			throws MeetingException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(Meeting.class, "queryListMeeting", offset, pagesize, conditions);
		} catch (Exception e) {
			throw new MeetingException("pagine query Meeting failed:", e);
		}
		return datas;

	}
	public List<Meeting> queryListMeetings(MeetingCondition conditions) throws MeetingException {
		try {
			List<Meeting> beans = executor.queryListBean(Meeting.class, "queryListMeeting", conditions);
			return beans;
		} catch (Exception e) {
			throw new MeetingException("query Meeting failed:", e);
		}

	}

	@Override
	public List<Meeting> queryListInfoMeetingByTopTen() {
		try {
			List<Meeting> beans = executor.queryListBean(Meeting.class, "queryListInfoMeetingByTopTen", null);
			return beans;
		} catch (Exception e) {
			throw new MeetingException("query Meeting failed:", e);
		}
	}
}