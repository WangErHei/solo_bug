package bug.frontstage.test_case.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.test_case.model.TestGroup;
import bug.frontstage.test_case.service.imp.ShowProMemberServiceImp;
import bug.frontstage.test_case.service.imp.TestCaseServiceImp;
import bug.frontstage.test_case.service.imp.TestGroupServiceImp;
@Controller
public class TestGroupController {
	@Autowired(required = false)
	@Qualifier("TestGroupServiceImp")
	private TestGroupServiceImp testGroupServiceImp;
	
	@Autowired(required=false)
	@Qualifier("TestCaseServiceImp")
	private TestCaseServiceImp testCaseServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowProMemberServiceImp")
	private ShowProMemberServiceImp showProMemberServiceImp;
	
	int deleteGroupFlag = 0;
	
	@RequestMapping("/editGroupName")
	@ResponseBody
	public Map<String,Object> editGroupName(HttpServletRequest req,int id,String name,int pid) {
		List<Map<String, Object>> list = testGroupServiceImp.showOneTestGroup(id);
		Map<String,Object>  map =new HashMap<String,Object>();
		Object group = list.get(0).get("group_name");
		String editGroupName = String.valueOf(group);
		Object manager = list.get(0).get("group_manager");
		int editGroupManager = Integer.parseInt(String.valueOf(manager));
		req.setAttribute("editGroupName", editGroupName);
		req.setAttribute("editGroupManager", editGroupManager);
		req.setAttribute("editGroupInfo", list);
		req.setAttribute("editGroupId", id);
		map.put("editGroupName", editGroupName);
		map.put("editGroupId",id );
		return map;
	}
	
	
	@RequestMapping("/updateTestGroup")
	public String updateTestGroup(HttpServletRequest req,String groupTitle, int groupManager,int grop,int pid) {
		
		TestGroup testGroup = new TestGroup();
		testGroup.setGroupId(grop);
		testGroup.setGroupName(groupTitle);
		testGroup.setManagerId(groupManager);
		testGroupServiceImp.updateTestGroup(testGroup);
		List<Map<String, Object>> list = testGroupServiceImp.showTestGroup(pid);
		req.getSession().setAttribute("groupList", list);
		return "EditBugInfo";
	}
	
	
	
	@RequestMapping("/showGroup")
	public String showGroup(HttpServletRequest req,int pid) {
		List<Map<String, Object>> list = testGroupServiceImp.showTestGroup(pid);
		req.getSession().setAttribute("groupList", list);
		return "showGroup";
	}
	
	@RequestMapping("/deleteGroup")
	@ResponseBody
	public Map<String,Object> deleteGroup(HttpServletRequest req,int did) {
		Map<String,Object> result = new HashMap<String,Object>();
		int resultCode = testCaseServiceImp.showByGroupId(did);
		if(resultCode == 0){
			boolean delResult = testGroupServiceImp.deleteOneGroup(did);
			if(delResult){
				result.put("result", true);
				result.put("mess", "删除成功！");
			}else{
				result.put("result", false);
				result.put("mess", "删除失败-系统出错！");
			}
		}else{
			result.put("result", false);
			result.put("mess", "该测试组中包含用例-不可删除！");
		}
		return result;
	}
	
	@RequestMapping("/addGroup")
	public  String addGroup(HttpServletRequest req){
		return "addGroup";
	}
	
	@RequestMapping("/addTestGroup")
	public  String addTestGroup(HttpServletRequest req,int bid,int pid,String groupName){
		TestGroup testGroup = new TestGroup();
		testGroup.setGroupName(groupName);
		testGroup.setManagerId(bid);
		testGroup.setProgramId(pid);
		testGroupServiceImp.addTestGroup(testGroup);
		return "addGroup";
	}
}
