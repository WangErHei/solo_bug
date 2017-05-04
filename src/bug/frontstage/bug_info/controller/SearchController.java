package bug.frontstage.bug_info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import bug.frontstage.bug_info.service.imp.SearchServiceimp;

@Controller
public class SearchController {

	private String everycount = "5";
	private String pagecount;

	@Autowired
	@Qualifier("SearchServiceimp")
	private SearchServiceimp searchServiceimp;

	@RequestMapping("/search")
	
	public String  search(HttpServletRequest req, String currpage,int pid) {	 
		Map<String,Object> map = new HashMap();
		String  content  =req.getParameter("content");
		int allnum = searchServiceimp.searchSum(pid, content);
		int count = Integer.parseInt(everycount);

		if (allnum % count == 0) {
			pagecount = (allnum / count) + "";
		} else {
			pagecount = (allnum / count + 1) + "";
		}

		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.getSession().setAttribute("currpage", pagecount);
			List<Map<String, Object>> allbug = searchServiceimp.search(pid, pagecount, everycount, content);
			req.getSession().setAttribute("allbug", allbug);
			req.getSession().setAttribute("allnum", allnum);
			req.getSession().setAttribute("pagecount", pagecount);
			req.getSession().setAttribute("content", content);
			String path = req.getContextPath();
			map.put("result", path+"/allBug");
			return "search";
		} else {
			if (Integer.parseInt(currpage) < 1) {
				req.getSession().setAttribute("currpage", "1");
				List<Map<String, Object>> allbug = searchServiceimp.search(pid,"1", everycount, content);
				req.getSession().setAttribute("allbug", allbug);
				req.getSession().setAttribute("allnum", allnum);
				req.getSession().setAttribute("pagecount", pagecount);
				req.getSession().setAttribute("content", content);
				String path = req.getContextPath();
				map.put("result", path+"/allBug");
				return "search";
			}

			else {
				List<Map<String, Object>> allbug = searchServiceimp.search(pid, currpage, everycount, content);

				req.getSession().setAttribute("currpage", currpage);
				req.getSession().setAttribute("allbug", allbug);
				req.getSession().setAttribute("allnum", allnum);
				req.getSession().setAttribute("pagecount", pagecount);
				req.getSession().setAttribute("content", content);
				String path = req.getContextPath();
				map.put("result", path+"/allBug");
				return "search";
			}
		}

	}

}
