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

/**
 * <p>Title: MeetingException</p> <p>Description: 会议管理异常处理类 </p> <p>bc</p>
 * <p>Copyright (c) 2007</p> @Date 2018-05-19 12:04:43 @author lijia @version
 * v1.0
 */
public class MeetingException extends RuntimeException {

	public MeetingException() {
		super();
	}
	public MeetingException(String message, Throwable cause) {
		super(message, cause);
	}

	public MeetingException(String message) {
		super(message);
	}

	public MeetingException(Throwable cause) {
		super(cause);
	}

}