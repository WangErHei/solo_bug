package bug.frontstage.notice_manage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.notice_manage.service.imp.FilterNotyServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowCreaterNameServiceImp;
import bug.frontstage.personal_center.service.imp.ShowNameServiceImp;
@Controller
public class ShowNotyByFilterController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("FilterNotyServiceImp")
	private FilterNotyServiceImp  filterNotyServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNameServiceImp")
	private ShowNameServiceImp  showNameServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowCreaterNameServiceImp")
	private ShowCreaterNameServiceImp  showCreaterNameServiceImp;
	
	@RequestMapping("/showNotyByFilter")
	public  String showNotyByFilter(HttpServletRequest req,String creater ,String typeInfo,int pid,String currpage){
		int num = filterNotyServiceImp.countNotyByFilter(typeInfo, creater, pid);

		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}
		
		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.getSession().setAttribute("currpage", pagecount);
			
			List<Map<String,Object>> list = filterNotyServiceImp.showNotyByFilter(typeInfo, creater, pid,pagecount,everycount);
			List nameList = showCreaterNameServiceImp.showNameList(typeInfo, pid);

			req.getSession().setAttribute("nameList",nameList );
			req.getSession().setAttribute("typeSelect",typeInfo );
			req.getSession().setAttribute("createrSelect",creater );
			req.getSession().setAttribute("noticeList", list);
			
			req.getSession().setAttribute("numNotice", num);
			req.getSession().setAttribute("pagecount", pagecount);
			return "noticeAll";
		}else {
			if (Integer.parseInt(currpage) < 1) {
				req.getSession().setAttribute("currpage", "1");
				
				List<Map<String,Object>> list = filterNotyServiceImp.showNotyByFilter(typeInfo, creater, pid,"1",everycount);
				List nameList = showCreaterNameServiceImp.showNameList(typeInfo, pid);
				if(nameList.size()==0){
					req.getSession().setAttribute("createrSelect","È«²¿" );
				}else{
					req.getSession().setAttribute("createrSelect",creater );
				}
				req.getSession().setAttribute("nameList",nameList );
				req.getSession().setAttribute("typeSelect",typeInfo );
				
				req.getSession().setAttribute("noticeList", list);
				
				req.getSession().setAttribute("numNotice", num);
				req.getSession().setAttribute("pagecount", pagecount);
				return "noticeAll";
			}else {
			

				List<Map<String,Object>> list = filterNotyServiceImp.showNotyByFilter(typeInfo, creater,pid,currpage,everycount);
				List nameList = showCreaterNameServiceImp.showNameList(typeInfo,pid);
				if(nameList.size()==0){
					req.getSession().setAttribute("nameSize",0 );

				}else{
					req.getSession().setAttribute("nameSize",1 );
				}
				
				req.getSession().setAttribute("nameList",nameList );
				req.getSession().setAttribute("typeSelect",typeInfo );
				req.getSession().setAttribute("createrSelect",creater );
				
				req.getSession().setAttribute("noticeList", list);
				req.getSession().setAttribute("currpage", currpage);
				req.getSession().setAttribute("numNotice", num);
				req.getSession().setAttribute("pagecount", pagecount);
				return "noticeAll";
			}
			
		}
		
	}
}
