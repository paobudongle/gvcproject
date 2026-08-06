
package com.pcloud.examinationreport.service;

import com.pcloud.examinationreport.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import com.frameworkset.orm.transaction.TransactionManager;


public class ExaminationReportServiceImpl implements ExaminationReportService {

	private static Logger log = LoggerFactory
			.getLogger(ExaminationReportServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addExaminationReport(ExaminationReport examinationReport) throws ExaminationReportException {
		// 业务组件
		try {
			executor.insertBean("addExaminationReport", examinationReport);
		} catch (Throwable e) {
			throw new ExaminationReportException("add ExaminationReport failed:", e);
		}

	}
	public void deleteExaminationReport(String experId) throws ExaminationReportException {
		try {
			executor.delete("deleteByKey", experId);
		} catch (Throwable e) {
			throw new ExaminationReportException("delete ExaminationReport failed::experId=" + experId, e);
		}

	}
	public void deleteBatchExaminationReport(ExaminationReportCondition reportCondition) throws ExaminationReportException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteBean("deleteByKey", reportCondition);
			executor.deleteBean("deleteExperDoc", reportCondition);
			tm.commit();
		} catch (Throwable e) {

			throw new ExaminationReportException("batch delete ExaminationReport failed:", e);
		} finally {
			tm.release();
		}

	}
	public void updateExaminationReport(ExaminationReport examinationReport) throws ExaminationReportException {
		try {
			executor.updateBean("updateExaminationReport", examinationReport);
		} catch (Throwable e) {
			throw new ExaminationReportException("update ExaminationReport failed::", e);
		}

	}
	public ExaminationReport getExaminationReport(String experId) throws ExaminationReportException {
		try {
			ExaminationReport bean = executor.queryObject(ExaminationReport.class, "selectById", experId);
			return bean;
		} catch (Throwable e) {
			throw new ExaminationReportException("get ExaminationReport failed::experId=" + experId, e);
		}

	}
	public ListInfo queryListInfoExaminationReports(ExaminationReportCondition conditions, long offset, int pagesize)
			throws ExaminationReportException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(ExaminationReport.class, "queryListExaminationReport", offset, pagesize,
					conditions);
		} catch (Exception e) {
			throw new ExaminationReportException("pagine query ExaminationReport failed:", e);
		}
		return datas;

	}
	public List<ExaminationReport> queryListExaminationReports(ExaminationReportCondition conditions)
			throws ExaminationReportException {
		try {
			List<ExaminationReport> beans = executor.queryListBean(ExaminationReport.class,
					"queryListExaminationReport", conditions);
			return beans;
		} catch (Exception e) {
			throw new ExaminationReportException("query ExaminationReport failed:", e);
		}

	}

	@Override
	public List<ExperClass> queryListClass() {
		try {
			List<ExperClass> beans = executor.queryListBean(ExperClass.class, "queryListClass",null);
			return beans;
		} catch (Exception e) {
			throw new ExaminationReportException("query queryListClass failed:", e);
		}
	}

	@Override
	public ExperDoc queryExperDoc(ExperDocCondition conditions) throws ExaminationReportException {
		try {
			ExperDoc bean = executor.queryObjectBean(ExperDoc.class, "queryExperDoc", conditions);
			return bean;
		} catch (Throwable e) {
			throw new ExaminationReportException("queryExperDoc failed:", e);
		}
	}

	@Override
	public ExperDoc queryIsExperDoc(ExperDocCondition conditions) throws ExaminationReportException {
		try {
			ExperDoc bean = executor.queryObjectBean(ExperDoc.class, "queryIsExperDoc", conditions);
			return bean;
		} catch (Throwable e) {
			throw new ExaminationReportException("queryExperDoc failed:", e);
		}
	}

	@Override
	public void addExperDoc(ExperDoc experDoc) throws ExaminationReportException {
// 业务组件
		try {
			executor.insertBean("addExperDoc", experDoc);
		} catch (Throwable e) {
			throw new ExaminationReportException("add ExperDoc failed:", e);
		}
	}

	@Override
	public void updateExperDoc(ExperDoc experDoc) throws ExaminationReportException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.updateBean("updateExperDoc", experDoc);
            ExaminationReport examinationReport =  getExaminationReport(experDoc.getExperId());
            long totalSocre = experDoc.getPlanSocre() + experDoc.getReportSocre() + examinationReport.getOperatSocre();
            examinationReport.setTotalSocre(totalSocre);
            updateExaminationReport(examinationReport);
//			executor.delete("deleteExperPerson", experDoc.getExperId());
//			executor.updateBean("insertExperPerson", experDoc);
			tm.commit();
		} catch (Throwable e) {
			throw new ExaminationReportException("update ExperDoc failed::", e);
		}finally {
			tm.release();
		}
	}

	@Override
	public ExaminationReport getExaminationReport(ExperDocCondition conditions) {
		try {
			ExaminationReport bean = executor.queryObjectBean(ExaminationReport.class, "getExaminationReport", conditions);
			return bean;
		} catch (Throwable e) {
			throw new ExaminationReportException("getExaminationReport failed:", e);
		}
	}

	@Override
	public List<ExperClass> queryListClassByUserId(String userId) throws ExaminationReportException {
		try {
			List<ExperClass> beans = executor.queryList(ExperClass.class, "queryListClassByUserId",userId);
			return beans;
		} catch (Exception e) {
			throw new ExaminationReportException("query queryListClass failed:", e);
		}
	}
}