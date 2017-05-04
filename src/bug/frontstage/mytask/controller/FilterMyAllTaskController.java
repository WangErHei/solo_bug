package bug.frontstage.mytask.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.mytask.service.imp.AssignOthersServiceImp;
import bug.frontstage.mytask.service.imp.FilterBugServiceImp;
@Controller
public class FilterMyAllTaskController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("FilterBugServiceImp")
	private FilterBugServiceImp  filterBugServiceImp;
	
	
	@RequestMapping("/filterMyAllTask")
	public String  filterMyAllTask(HttpServletRequest req,String type, String state, String prop, String signer,int bid,int pid,String currpage){
			
			int num = filterBugServiceImp.countFilterMyAllTask(type, state, prop, signer, bid, pid);
		
			int count = Integer.parseInt(everycount);
			if (num % count == 0) {
				pagecount = (num / count) + "";
			} else {
				pagecount = (num / count + 1) + "";
			}
			
			if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
				req.getSession().setAttribute("currpage", pagecount);
				List list = filterBugServiceImp.filterMyAllTask(type, state, prop, signer, bid, pid, pagecount, everycount);
				
				List myAllTaskMaker = filterBugServiceImp.myAllTaskMaker(type, state, prop, bid, pid);
				if(myAllTaskMaker.size()==0){
					req.getSession().setAttribute("myAllNameSize",0 );

				}else{
					req.getSession().setAttribute("myAllNameSize",1 );
				}
				req.getSession().setAttribute("myAllTaskSigner", myAllTaskMaker);
				req.getSession().setAttribute("mtTypeSelect",type );
				req.getSession().setAttribute("mtStateSelect",state );
				req.getSession().setAttribute("mtPropSelect",prop );
				req.getSession().setAttribute("mtSignerSelect",signer );
				req.getSession().setAttribute("listMyAllTask", list);	
				req.getSession().setAttribute("numMyAll", num);
				req.setAttribute("pagecount", pagecount);
				return "bugFixByMe";
			}else {
				if (Integer.parseInt(currpage) < 1) {
					req.getSession().setAttribute("currpage", "1");
					List list = filterBugServiceImp.filterMyAllTask(type, state, prop, signer, bid, pid,"1",everycount);
				
					List myAllTaskMaker = filterBugServiceImp.myAllTaskMaker(type, state, prop, bid, pid);
					if(myAllTaskMaker.size()==0){
						req.getSession().setAttribute("myAllNameSize",0 );

					}else{
						req.getSession().setAttribute("myAllNameSize",1 );
					}
					req.getSession().setAttribute("myAllTaskSigner", myAllTaskMaker);
					req.getSession().setAttribute("mtTypeSelect",type );
					req.getSession().setAttribute("mtStateSelect",state );
					req.getSession().setAttribute("mtPropSelect",prop );
					req.getSession().setAttribute("mtSignerSelect",signer );
					req.getSession().setAttribute("listMyAllTask", list);	
					req.getSession().setAttribute("numMyAll", num);
					req.setAttribute("pagecount", pagecount);
					return "bugFixByMe";
				}else {
					List list = filterBugServiceImp.filterMyAllTask(type, state, prop, signer,bid, pid,currpage,everycount);
					List myAllTaskMaker = filterBugServiceImp.myAllTaskMaker(type, state, prop, bid, pid);
					if(myAllTaskMaker.size()==0){
						req.getSession().setAttribute("myAllNameSize",0 );

					}else{
						req.getSession().setAttribute("myAllNameSize",1 );
					}
					req.getSession().setAttribute("myAllTaskSigner", myAllTaskMaker);
					req.getSession().setAttribute("mtTypeSelect",type );
					req.getSession().setAttribute("mtStateSelect",state );
					req.getSession().setAttribute("mtPropSelect",prop );
					req.getSession().setAttribute("mtSignerSelect",signer );
					req.getSession().setAttribute("listMyAllTask", list);	
					req.getSession().setAttribute("numMyAll", num);
					req.getSession().setAttribute("currpage", currpage);
					req.getSession().setAttribute("pagecount", pagecount);
					return "bugFixByMe";
				}
				
			}
			

		
	}
}
