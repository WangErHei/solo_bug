package bug.frontstage.notice_manage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.notice_manage.model.Notify;
import bug.frontstage.notice_manage.service.imp.ShowOneNotifyServiceImp;
import bug.frontstage.notice_manage.service.imp.UpdateNotifyServiceImp;
import bug.frontstage.personal_center.service.imp.ShowNameServiceImp;

@Controller
public class UpdateNotifyController {

	@Autowired
	@Qualifier("UpdateNotifyServiceImp")
	private UpdateNotifyServiceImp updateNotifyServiceImp;
	
	@Autowired
	@Qualifier("ShowOneNotifyServiceImp")
	private ShowOneNotifyServiceImp showOneNotifyServiceImp;
	@Autowired
	@Qualifier("ShowNameServiceImp")
	private ShowNameServiceImp showNameServiceImp;
	
	@RequestMapping("/updateNotify")
	public  String updateNotify(HttpServletRequest req,int bid,int pid,int notifyId,String noticeType,String title,String description){
		String photo= req.getParameter("result8");
    	String  file = req.getParameter("results8");
    	String  fileName = req.getParameter("resultss8");
		Notify noty = new Notify();
		noty.setBid(bid);
		noty.setContent(description);
		noty.setNotifyId(notifyId);
		noty.setPid(pid);
		noty.setTitle(title);
		noty.setType(noticeType);
		noty.setNotify_photo(photo);
		noty.setNotify_fu(file);
		noty.setNotify_fu_name(fileName);
		updateNotifyServiceImp.updateNotify(noty);
		List<Map<String,Object>> list = showOneNotifyServiceImp.showOneNotify(notifyId);
		Object i =list.get(0).get("buser_id");
		int createId = Integer.parseInt(String.valueOf(i));
		String notyCreateName = showNameServiceImp.showName(createId);
		String oneNotyType = (String)list.get(0).get("notify_type");
		req.getSession().setAttribute("oneNotify", list);
		req.getSession().setAttribute("notyCreateName", notyCreateName);
		req.getSession().setAttribute("oneNotyType", oneNotyType);

		return "informDetails";
	
	}
}
