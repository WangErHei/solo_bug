package bug.frontstage.notice_manage.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.notice_manage.service.imp.ShowCreaterNameServiceImp;
import bug.frontstage.notice_manage.model.Notify;
import bug.frontstage.notice_manage.service.imp.AddNotifyServiceImp;
import bug.frontstage.notice_manage.service.imp.ShowNoticeServiceImp;
import bug.frontstage.personal_center.service.imp.ShowNameServiceImp;

@Controller
public class AddNotifyController {

	
	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("AddNotifyServiceImp")
	private AddNotifyServiceImp  addNotifyServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNoticeServiceImp")
	private ShowNoticeServiceImp  showNoticeServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowNameServiceImp")
	private ShowNameServiceImp  showNameServiceImp;
		
	@Autowired(required=false)
	@Qualifier("ShowCreaterNameServiceImp")
	private ShowCreaterNameServiceImp  showCreaterNameServiceImp;
	
	@RequestMapping("/addNotify")
	public  String notifyAll(HttpServletRequest req,int bid,int pid,String currpage) throws UnsupportedEncodingException{
		
		String title = req.getParameter("title");
		String type = req.getParameter("noticeType");
		String content = req.getParameter("content");     
        String photo= req.getParameter("result1");
    	String  file = req.getParameter("results1");
    	String  fileName = req.getParameter("resultss1");
		Notify notify = new Notify();
		notify.setNotify_photo(photo);
		notify.setNotify_fu(file);
		notify.setNotify_fu_name(fileName);
		notify.setTitle(title);
		notify.setType(type);
		notify.setContent(content);
		notify.setBid(bid);
		notify.setPid(pid);
		addNotifyServiceImp.addNotify(notify);
		
		
		int num = showNoticeServiceImp.allNotifyNum(pid);
		
		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}
		
		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.setAttribute("currpage", pagecount);
			int i = 0;
			List<Map<String,Object>> list = showNoticeServiceImp.showNotice(pid,pagecount,everycount);
			if(list.size()>0){
				for(Map<String,Object> map : list){
					Object busId =list.get(i).get("buser_id");
					int buserId = Integer.parseInt(String.valueOf(busId));
					String name = showNameServiceImp.showName(buserId);
					map.put("buser_name", name);
					i++;
				}
			}
			
			List nameList = showCreaterNameServiceImp.showNameList(type, pid);
			req.getSession().setAttribute("nameList",nameList );
			req.getSession().setAttribute("typeSelect","全部" );
			req.getSession().setAttribute("createrSelect","全部" );
			req.getSession().setAttribute("noticeList", list);
			req.getSession().setAttribute("numNotice", num);
			req.setAttribute("pagecount", pagecount);
			
			return "noticeAll";
		}else {
			if (Integer.parseInt(currpage) < 1) {
				req.setAttribute("currpage", "1");
				int i = 0;
				List<Map<String,Object>> list = showNoticeServiceImp.showNotice(pid,"1",everycount);
				if(list.size()>0){
					for(Map<String,Object> map : list){
						Object busId =list.get(i).get("buser_id");
						int buserId = Integer.parseInt(String.valueOf(busId));
						String name = showNameServiceImp.showName(buserId);
						map.put("buser_name", name);
						i++;
					}
				}
				
				List nameList = showCreaterNameServiceImp.showNameList(type, pid);
				req.getSession().setAttribute("nameList",nameList );
				req.getSession().setAttribute("typeSelect","全部" );
				req.getSession().setAttribute("createrSelect","全部" );
				req.getSession().setAttribute("noticeList", list);
				req.getSession().setAttribute("numNotice", num);
				req.setAttribute("pagecount", pagecount);
				
				return "noticeAll";
			}else {
				int i = 0;
				List<Map<String,Object>> list = showNoticeServiceImp.showNotice(pid,currpage,everycount);
				if(list.size()>0){
					for(Map<String,Object> map : list){
						Object busId =list.get(i).get("buser_id");
						int buserId = Integer.parseInt(String.valueOf(busId));
						String name = showNameServiceImp.showName(buserId);
						map.put("buser_name", name);
						i++;
					}
				}
				
				
				List nameList = showCreaterNameServiceImp.showNameList(type, pid);
				req.getSession().setAttribute("nameList",nameList );
				
				req.getSession().setAttribute("typeSelect","全部" );
				req.getSession().setAttribute("createrSelect","全部" );
				req.getSession().setAttribute("noticeList", list);
				req.setAttribute("currpage", currpage);
				req.getSession().setAttribute("numNotice", num);
				req.setAttribute("pagecount", pagecount);
				
				return "noticeAll";
			}
			
		}
		
	}

	
}
