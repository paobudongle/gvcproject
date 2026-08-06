
package com.pcloud.question.action;

import com.common.DateUtils;
import com.pcloud.question.entity.*;
import com.frameworkset.util.ListInfo;
import org.frameworkset.platform.security.AccessControl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.List;
import java.util.Map;
import com.frameworkset.util.StringUtil;
import com.pcloud.question.service.*;
import org.frameworkset.util.annotations.ResponseBody;
import org.frameworkset.web.servlet.ModelMap;
import org.frameworkset.util.annotations.PagerParam;
import org.frameworkset.util.annotations.MapKey;


public class QuestionController {

	private static Logger log = LoggerFactory.getLogger(QuestionController.class);

	private QuestionService questionService;


	public @ResponseBody String addQuestion(Question question) {
		// 控制器
		try {
			AccessControl control = AccessControl.getAccessControl();
			question.setUserId(control.getUserID());
			question.setUserName(control.getUserName());
			question.setQTime(DateUtils.getStrFormTime("yyyy-MM-dd HH:mm:ss",new Date()));
			questionService.addQuestion(question);
			return "success";
		} catch (QuestionException e) {
			log.error("add Question failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add Question failed:", e);
			return StringUtil.formatBRException(e);
		}

	}


	public @ResponseBody String addQuestionAnswer(QuestionAnswer questionAnswer) {
		// 控制器
		try {
			AccessControl control = AccessControl.getAccessControl();
			questionAnswer.setUserId(control.getUserID());
			questionAnswer.setUserName(control.getUserName());
			questionAnswer.setAnswerTime(DateUtils.getStrFormTime("yyyy-MM-dd HH:mm:ss",new Date()));
			questionService.addQuestionAnswer(questionAnswer);
			return "success";
		} catch (QuestionException e) {
			log.error("add Question failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("add Question failed:", e);
			return StringUtil.formatBRException(e);
		}

	}



	public @ResponseBody String deleteQuestion(String qId) {
		try {
			questionService.deleteQuestion(qId);
			return "success";
		} catch (QuestionException e) {
			log.error("delete Question failed:", e);
			return StringUtil.formatBRException(e);
		} catch (Throwable e) {
			log.error("delete Question failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String deleteBatchQuestion(String... qIds) {
		try {
			questionService.deleteBatchQuestion(qIds);
			return "success";
		} catch (Throwable e) {
			log.error("delete Batch qIds failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public @ResponseBody String updateQuestion(Question question) {
		try {
			questionService.updateQuestion(question);
			return "success";
		} catch (Throwable e) {
			log.error("update Question failed:", e);
			return StringUtil.formatBRException(e);
		}

	}
	public String getQuestion(String qId, ModelMap model) throws QuestionException {
		try {
			Question question = questionService.getQuestion(qId);

			List<QuestionAnswer> answersList = questionService.queryListQuestionAnswer(qId);

			model.addAttribute("question", question);
			model.addAttribute("answersList", answersList);
			return "path:getQuestion";
		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("get Question failed::qId=" + qId, e);
		}

	}
	public String queryListInfoQuestions(QuestionCondition conditions,
			@PagerParam(name = PagerParam.SORT, defaultvalue = "q_time") String sortKey,
			@PagerParam(name = PagerParam.DESC, defaultvalue = "false") boolean desc,
			@PagerParam(name = PagerParam.OFFSET) long offset,
			@PagerParam(name = PagerParam.PAGE_SIZE, defaultvalue = "10") int pagesize, ModelMap model)
					throws QuestionException {

		try {

            AccessControl control = AccessControl.getAccessControl();
            conditions.setUserId(control.getUserID());

			if (sortKey != null && !sortKey.equals("")) {
				conditions.setSortKey(sortKey);
				conditions.setSortDesc(desc);
			}
			String qTitle = conditions.getQTitle();

			if (qTitle != null && !qTitle.equals("")) {
				conditions.setQTitle("%" + qTitle + "%");
			}


			ListInfo questions = questionService.queryListInfoQuestions(conditions, offset, pagesize);
			model.addAttribute("questions", questions);
			return "path:queryListInfoQuestions";
		} catch (QuestionException e) {
			throw e;
		} catch (Exception e) {
			throw new QuestionException("pagine query Question failed:", e);
		}

	}
	public String queryListQuestions(QuestionCondition conditions, ModelMap model) throws QuestionException {
		try {
			String qTitle = conditions.getQTitle();
			if (qTitle != null && !qTitle.equals("")) {
				conditions.setQTitle("%" + qTitle + "%");
			}
			List<Question> questions = questionService.queryListQuestions(conditions);
			model.addAttribute("questions", questions);
			return "path:queryListQuestions";
		} catch (QuestionException e) {
			throw e;
		} catch (Exception e) {
			throw new QuestionException("query Question failed:", e);
		}

	}
	public String toUpdateQuestion(String qId, ModelMap model) throws QuestionException {
		try {
			Question question = questionService.getQuestion(qId);
			model.addAttribute("question", question);
			return "path:updateQuestion";
		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("get Question failed::qId=" + qId, e);
		}

	}
	public String toAddQuestion() {
		return "path:addQuestion";
	}
	public String index() {
		return "path:index";

	}
}