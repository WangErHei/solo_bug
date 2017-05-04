package bug.frontstage.test_case.service;

import java.util.List;
import java.util.Map;

import bug.frontstage.test_case.model.TestGroup;

public interface ITestGroupService {

	//查询测试组
	public List<Map<String,Object>> showTestGroup(int pid);
	//增加测试组
	public void addTestGroup(TestGroup testGroup);
	//修改测试组信息
	public void updateTestGroup(TestGroup testGroup);	
	//删除某测试组
	public boolean deleteOneGroup(int id);
	//查询某测试组
	public List<Map<String,Object>> showOneTestGroup(int gid);
	//查询产品
	public List<Map<String,Object>> showProduce(int bid);

}