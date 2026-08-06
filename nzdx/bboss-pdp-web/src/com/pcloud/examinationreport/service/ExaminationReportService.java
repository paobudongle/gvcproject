
package com.pcloud.examinationreport.service;

import com.pcloud.examinationreport.entity.*;
import com.frameworkset.util.ListInfo;
import java.util.List;


public interface ExaminationReportService {
	public void addExaminationReport(ExaminationReport examinationReport) throws ExaminationReportException;
	public void deleteExaminationReport(String experId) throws ExaminationReportException;
	public void deleteBatchExaminationReport(ExaminationReportCondition reportCondition) throws ExaminationReportException;
	public void updateExaminationReport(ExaminationReport examinationReport) throws ExaminationReportException;
	public ExaminationReport getExaminationReport(String experId) throws ExaminationReportException;
	public ListInfo queryListInfoExaminationReports(ExaminationReportCondition conditions, long offset, int pagesize)
			throws ExaminationReportException;
	public List<ExaminationReport> queryListExaminationReports(ExaminationReportCondition conditions)
			throws ExaminationReportException;

    List<ExperClass> queryListClass() throws ExaminationReportException;

    ExperDoc queryExperDoc(ExperDocCondition conditions) throws ExaminationReportException;

	void addExperDoc(ExperDoc experDoc) throws ExaminationReportException;

	void updateExperDoc(ExperDoc experDoc) throws ExaminationReportException;

	ExaminationReport getExaminationReport(ExperDocCondition conditions) throws ExaminationReportException;

    List<ExperClass> queryListClassByUserId(String userID) throws ExaminationReportException;


	ExperDoc queryIsExperDoc(ExperDocCondition conditions) throws ExaminationReportException;

}