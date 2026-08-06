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
import java.util.List;

/**
 * <p>Title: MeetingService</p> <p>Description: 会议管理服务接口 </p> <p>bc</p>
 * <p>Copyright (c) 2015</p> @Date 2018-05-19 12:04:43 @author lijia @version
 * v1.0
 */
public interface MeetingService {
	public void addMeeting(Meeting meeting) throws MeetingException;
	public void deleteMeeting(String meetingId) throws MeetingException;
	public void deleteBatchMeeting(String... meetingIds) throws MeetingException;
	public void updateMeeting(Meeting meeting) throws MeetingException;
	public Meeting getMeeting(String meetingId) throws MeetingException;
	public ListInfo queryListInfoMeetings(MeetingCondition conditions, long offset, int pagesize)
			throws MeetingException;
	public List<Meeting> queryListMeetings(MeetingCondition conditions) throws MeetingException;

    List<Meeting> queryListInfoMeetingByTopTen();
}