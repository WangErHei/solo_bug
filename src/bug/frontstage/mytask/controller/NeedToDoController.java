package bug.frontstage.mytask.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.mytask.service.imp.NeedToDoServiceImp;

@Controller
public class NeedToDoController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("NeedToDoServiceImp")
	private NeedToDoServiceImp  needToDoServiceImp;
	

	
	@RequestMapping("/needToDo")
	public String   needToDo(HttpServletRequest req,int bid,int pid,String currpage){
		
		int numNeed = needToDoServiceImp.countNeedToDo(bid, pid);
		
		int count = Integer.parseInt(everycount);
		if (numNeed % count == 0) {
			pagecount = (numNeed / count) + "";
		} else {
			pagecount = (numNeed / count + 1) + "";
		}
		
		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.setAttribute("currpage", pagecount);
			List<Map<String,Object>> list = needToDoServiceImp.needToDo(bid, pid, pagecount, everycount);
			
			req.setAttribute("listNeedToDo",list);
			req.getSession().setAttribute("numNeed", numNeed);
			req.setAttribute("pagecount", pagecount);
			req.getSession().setAttribute("ntTypeSelect","全部" );
			req.getSession().setAttribute("ntStateSelect","全部活动" );
			req.getSession().setAttribute("ntPropSelect","全部" );
			return "bugAssignToMe";
		}else {
			if (Integer.parseInt(currpage) < 1) {
				req.setAttribute("currpage", "1");
				List<Map<String,Object>> list = needToDoServiceImp.needToDo(bid,pid,"1",everycount);
				
				req.setAttribute("listNeedToDo",list);
				req.getSession().setAttribute("numNeed", numNeed);
				req.setAttribute("pagecount", pagecount);
				return "bugAssignToMe";
			}else {
				List<Map<String,Object>> list = needToDoServiceImp.needToDo(bid,pid,currpage,everycount);
		
				req.getSession().setAttribute("ntTypeSelect","全部" );
				req.getSession().setAttribute("ntStateSelect","全部活动" );
				req.getSession().setAttribute("ntPropSelect","全部" );
				req.setAttribute("listNeedToDo",list);
				req.setAttribute("currpage", currpage);
				req.getSession().setAttribute("numNeed", numNeed);
				req.setAttribute("pagecount", pagecount);
				return "bugAssignToMe";
			}
			
		}
		
		
	}
}
