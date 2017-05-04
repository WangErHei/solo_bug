package bug.frontstage.notice_manage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.notice_manage.service.imp.ShowCreaterNameServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowNoticeServiceImp;
import bug.frontstage.personal_center.service.imp.ShowNameServiceImp;
@Controller
public class ShowNoticeController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("ShowNoticeServiceImp")
	private ShowNoticeServiceImp  showNoticeServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNameServiceImp")
	private ShowNameServiceImp  showNameServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowCreaterNameServiceImp")
	private ShowCreaterNameServiceImp  showCreaterNameServiceImp;
	
	@RequestMapping("/showNotice")
	public  String showNotify(HttpServletRequest req,int bid,int pid,String currpage){
		
		int num = showNoticeServiceImp.allNotifyNum(pid);
		
		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}
		
		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.setAttribute("currpage", pagecount);
			List<Map<String,Object>> list = showNoticeServiceImp.showNotice(pid,pagecount,everycount);
			
			req.getSession().setAttribute("typeSelect", "全部");
			
			req.getSession().setAttribute("noticeList", list);
			req.getSession().setAttribute("numNotice", num);
			req.setAttribute("pagecount", pagecount);
			return "noticeAll";
		}else {
			if (Integer.parseInt(currpage) < 1) {
				req.setAttribute("currpage", "1");
				List<Map<String,Object>> list = showNoticeServiceImp.showNotice(pid,"1",everycount);
				req.getSession().setAttribute("typeSelect", "全部");
				req.getSession().setAttribute("noticeList", list);
				req.getSession().setAttribute("numNotice", num);
				req.setAttribute("pagecount", pagecount);
				return "noticeAll";
			}else {
				List<Map<String,Object>> list = showNoticeServiceImp.showNotice(pid,currpage,everycount);
				List nameList = showCreaterNameServiceImp.showNameList("全部", pid);
				if(nameList.size()==0){
					req.getSession().setAttribute("nameSize",0 );

				}else{
					req.getSession().setAttribute("nameSize",1 );
				}
				req.getSession().setAttribute("nameList",nameList );
				req.getSession().setAttribute("typeSelect", "全部");
				req.getSession().setAttribute("createrSelect", "全部");
				req.getSession().setAttribute("noticeList", list);
				req.setAttribute("currpage", currpage);
				req.getSession().setAttribute("numNotice", num);
				req.setAttribute("pagecount", pagecount);
				return "noticeAll";
			}
			
		}
		
	}
}
