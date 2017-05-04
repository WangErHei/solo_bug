package bug.frontstage.mytask.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.mytask.service.imp.FilterBugServiceImp;
import bug.frontstage.mytask.service.imp.NeedToDoServiceImp;

@Controller
public class FilterNeedToDoController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("FilterBugServiceImp")
	private FilterBugServiceImp  filterBugServiceImp;

	
	@RequestMapping("/filterNeedToDo")
	public String   filterNeedToDo(HttpServletRequest req,String type, String state, String prop,int bid,int pid,String currpage){
		int numNeed = filterBugServiceImp.countFilterNeedToDo(type, state, prop, bid, pid);
		
		int count = Integer.parseInt(everycount);
		if (numNeed % count == 0) {
			pagecount = (numNeed / count) + "";
		} else {
			pagecount = (numNeed / count + 1) + "";
		}
		
		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.getSession().setAttribute("currpage", pagecount);
			List<Map<String,Object>> list = filterBugServiceImp.filterNeedToDo(type, state, prop, bid, pid, pagecount, everycount);
			req.getSession().setAttribute("listNeedToDo",list);
			
			req.getSession().setAttribute("ntTypeSelect",type );
			req.getSession().setAttribute("ntStateSelect",state );
			req.getSession().setAttribute("ntPropSelect",prop );
			req.getSession().setAttribute("numNeed", numNeed);
			req.getSession().setAttribute("pagecount", pagecount);
			return "bugAssignToMe";
		}else {
			if (Integer.parseInt(currpage) < 1) {
				req.getSession().setAttribute("currpage", "1");
				List<Map<String,Object>> list = filterBugServiceImp.filterNeedToDo(type, state, prop, bid,pid,"1",everycount);
				req.getSession().setAttribute("listNeedToDo",list);
				
				req.getSession().setAttribute("ntTypeSelect",type );
				req.getSession().setAttribute("ntStateSelect",state );
				req.getSession().setAttribute("ntPropSelect",prop );
				req.getSession().setAttribute("numNeed", numNeed);
				req.getSession().setAttribute("pagecount", pagecount);
				return "bugAssignToMe";
			}else {
				List<Map<String,Object>> list = filterBugServiceImp.filterNeedToDo(type, state, prop, bid, pid,currpage,everycount);
				req.getSession().setAttribute("listNeedToDo",list);
				
				req.getSession().setAttribute("ntTypeSelect",type );
				req.getSession().setAttribute("ntStateSelect",state );
				req.getSession().setAttribute("ntPropSelect",prop );
				req.getSession().setAttribute("currpage", currpage);
				req.getSession().setAttribute("numNeed", numNeed);
				req.getSession().setAttribute("pagecount", pagecount);
				return "bugAssignToMe";
			}
			
		}
		
		
	}
}
