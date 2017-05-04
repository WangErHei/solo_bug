package bug.frontstage.test_case.service;

import java.util.List;
import java.util.Map;

import bug.frontstage.test_case.model.TestCase;

public interface ITestCaseService {

	//查询该项目所有测试用例
	public List<Map<String,Object>> showAllTestCase(int pid,String currpage,String everycount);

	//查询该项目所有测试用例数量
	public int countTestCase(int pid);
	
	//查询某条用例信息
	public List<Map<String,Object>> showOneTestCase(int cid);
	
	//发布用例信息
	public void addTestCase(TestCase testCase);
	
	//修改用例信息
	public void updateTestCase(TestCase testCase);
	//删除某条用例信息
	public void deleteOneCase(int id);
	
		
	//查询相关BUg
	public   List<Map<String,Object>>  showCaseBug(int pid,int cid);
	
	//查询测试组中用例
	public int showByGroupId(int gid);
		
}
