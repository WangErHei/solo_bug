package bug.frontstage.mytask.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.mytask.service.imp.FilterBugServiceImp;
import bug.frontstage.mytask.service.imp.MyAllTaskServiceImp;
import bug.frontstage.mytask.service.imp.NeedToDoServiceImp;
@Controller
public class MyAllTaskController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("MyAllTaskServiceImp")
	private MyAllTaskServiceImp  myAllTaskServiceImp;
	
	@Autowired(required=false)
	@Qualifier("FilterBugServiceImp")
	private FilterBugServiceImp  filterBugServiceImp;
	
	@RequestMapping("/myAllTask")
	public String  myAllTask(HttpServletRequest req,int bid,int pid,String currpage){
		int num = myAllTaskServiceImp.countMyAllTask(bid, pid);
		
		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}
		
		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.setAttribute("currpage", pagecount);
			List list = myAllTaskServiceImp.myAll(bid, pid, pagecount, everycount);
			req.getSession().setAttribute("listMyAllTask", list);	
			req.getSession().setAttribute("numMyAll", num);
			req.setAttribute("pagecount", pagecount);
			List myAllTaskMaker = filterBugServiceImp.myAllTaskMaker("全部", "全部", "全部", bid, pid);
			if(myAllTaskMaker.size()==0){
				req.getSession().setAttribute("myAllNameSize",0 );

			}else{
				req.getSession().setAttribute("myAllNameSize",1 );
			}
			req.getSession().setAttribute("myAllTaskSigner", myAllTaskMaker);
			req.getSession().setAttribute("mtTypeSelect","全部" );
			req.getSession().setAttribute("mtStateSelect","全部" );
			req.getSession().setAttribute("mtPropSelect","全部" );
			req.getSession().setAttribute("mtSignerSelect","全部" );
			return "bugFixByMe";
		}else {
			if (Integer.parseInt(currpage) < 1) {
				req.setAttribute("currpage", "1");
				List list = myAllTaskServiceImp.myAll(bid, pid,"1",everycount);
				
				req.getSession().setAttribute("listMyAllTask", list);
				req.getSession().setAttribute("numMyAll", num);
				req.setAttribute("pagecount", pagecount);
				return "bugFixByMe";
			}else {
				List list = myAllTaskServiceImp.myAll(bid, pid,currpage,everycount);
				List myAllTaskMaker = filterBugServiceImp.myAllTaskMaker("全部", "全部", "全部", bid, pid);
				if(myAllTaskMaker.size()==0){
					req.getSession().setAttribute("myAllNameSize",0 );

				}else{
					req.getSession().setAttribute("myAllNameSize",1 );
				}
				req.getSession().setAttribute("myAllTaskSigner", myAllTaskMaker);
				req.getSession().setAttribute("mtTypeSelect","全部" );
				req.getSession().setAttribute("mtStateSelect","全部" );
				req.getSession().setAttribute("mtPropSelect","全部" );
				req.getSession().setAttribute("mtSignerSelect","全部" );
				req.getSession().setAttribute("listMyAllTask", list);
					
				req.setAttribute("currpage", currpage);
				req.getSession().setAttribute("numMyAll", num);
				req.setAttribute("pagecount", pagecount);
				return "bugFixByMe";
			}
		}				
	}
}
