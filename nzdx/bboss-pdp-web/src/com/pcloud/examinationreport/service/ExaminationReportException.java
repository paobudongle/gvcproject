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

package com.pcloud.examinationreport.service;

/**
 * <p>Title: ExaminationReportException</p> <p>Description: 考核报告异常处理类 </p>
 * <p>bxt</p> <p>Copyright (c) 2007</p> @Date 2019-10-26 17:56:09 @author
 * lijia @version v1.0
 */
public class ExaminationReportException extends RuntimeException {

	public ExaminationReportException() {
		super();
	}
	public ExaminationReportException(String message, Throwable cause) {
		super(message, cause);
	}

	public ExaminationReportException(String message) {
		super(message);
	}

	public ExaminationReportException(Throwable cause) {
		super(cause);
	}

}