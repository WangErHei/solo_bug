package bug.frontstage.program.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.program.service.imp.ExcelService;
import bug.frontstage.program.service.imp.ExcelUtil;

@Controller
public class ExcelUtilController {

	
	@Autowired
	@Qualifier("ExcelService")
	private ExcelService excelService;
	
	@RequestMapping("/Excel")
	  public String download(HttpServletRequest request, HttpServletResponse response,int pid,String date,String date1) throws IOException {
		        try {	
		            String fileName = "Bug记录";	
		            String columnNames[] = { "bug编号", "类型", "模块","标题","描述","状态","优先级","分配者","处理者","计划时间","截止时间","创建时间","修复时间" };// 列名	
		            String keys[] = {"bug_id","bug_type","produce_name","bug_title","bug_describe","bug_state","bug_prop","bug_signer","bug_maker","bug_plan_date","bug_lasted_date","bug_create_date","bug_repair_date"};// map中的key	
		            ByteArrayOutputStream os = new ByteArrayOutputStream();		
		 
		            List<Map<String,Object>>  excel = excelService.excel(pid, date, date1);
		            //调用工具类创建excel工作簿		
		          ExcelUtil.createWorkbook(excel, keys, columnNames).write(os);	
		            byte[] content = os.toByteArray();	
		            InputStream is = new ByteArrayInputStream(content);		
		            // 设置response参数，可以打开下载页面		
		            response.reset();		
		            response.setContentType("application/vnd.ms-excel;charset=utf-8");	
		            response.setHeader("Content-Disposition","attachment;filename=" + new String((fileName + ".xlsx").getBytes(), "iso-8859-1"));	
		            OutputStream out = response.getOutputStream();
		            byte[] b = new byte[2048];	
		            int length;
		            while ((length = is.read(b)) >=0) {
		                out.write(b,0, length);
		            }
	            // 关闭。
		            os.flush();		
		           os.close();		
		            is.close();	
		        } catch (Exception e) {		
		            e.printStackTrace();		
		        }
		        return null;	
		    }
		}
