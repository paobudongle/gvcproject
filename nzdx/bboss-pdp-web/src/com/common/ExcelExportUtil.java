package com.common;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Workbook;
import net.sf.jxls.transformer.XLSTransformer;


public class ExcelExportUtil {

	public static Workbook  exportExcel(Map<String, Object> beanParams, Class  class1, String xlsmodlename)
					throws Exception {
		InputStream in=null;
		Workbook workbook = null;
		try{

	        XLSTransformer transformer = new XLSTransformer();

	        try {
	        	in = class1.getResourceAsStream(xlsmodlename);
	        	workbook = transformer.transformXLS(in, beanParams);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			 if (in != null) {
	                try {
	                    in.close();
	                }
	                catch (IOException e) {
	                    throw new RuntimeException(e.getMessage(), e);
	                }
	            }
		}

		return workbook;
		
	}

	

	public  static void sendFile(HttpServletResponse response, String filename,
			Workbook workbook) throws Exception {
        OutputStream out = null;
        try {
        	if(workbook == null)
        		return;
        	out = response.getOutputStream();
        	

            response.setHeader("Content-Disposition", "attachment; filename=" + new String(filename.getBytes(),"ISO-8859-1").replaceAll(" ", "-"));
            response.setHeader("Accept-Ranges", "bytes");
            workbook.write(out);
            out.flush();
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	throw e;
        }
        finally {
            try
			{
            	if(out != null)
            		out.close();
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
        }
    }

}
