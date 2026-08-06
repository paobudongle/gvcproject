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

package com.pcloud.content.service;

/**
 * <p>Title: ContentException</p> <p>Description: 内容表异常处理类 </p> <p>xxx</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-04 17:27:23 @author lijia @version
 * v1.0
 */
public class ContentException extends RuntimeException {

	public ContentException() {
		super();
	}
	public ContentException(String message, Throwable cause) {
		super(message, cause);
	}

	public ContentException(String message) {
		super(message);
	}

	public ContentException(Throwable cause) {
		super(cause);
	}

}