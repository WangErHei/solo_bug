package bug.frontstage.notice_manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.notice_manage.service.imp.UpdateServiceimp;

@Controller
public class UpdateController {

	@Autowired(required=false)
	@Qualifier("UpdateServiceimp")
	private UpdateServiceimp updateServiceimp;
	
	@RequestMapping("/tosubmit")
	@ResponseBody
	public  Map<String,Object>  update (HttpServletRequest req,int notify_id){
	
		 List<Map<String,Object> > list = 	updateServiceimp.update(notify_id);
		 Map<String,Object> map =new HashMap<String,Object>();
		String notify_title =(String) list.get(0).get("notify_title");
		String notify_type =(String) list.get(0).get("notify_type");
		String notify_content =(String) list.get(0).get("notify_content");
		String notify_photo =(String) list.get(0).get("notify_photo");
		String notify_fu =(String) list.get(0).get("notify_fu");
		String notify_fu_name =(String) list.get(0).get("notify_fu_name");
		map.put("notify_title",notify_title);
		map.put("notify_type",notify_type);
		map.put("notify_content",notify_content);
		map.put("notify_photo",notify_photo);
		map.put("notify_fu",notify_fu);
		map.put("notify_fu_name",notify_fu_name);
		return  map;
	}
 	
	
}
