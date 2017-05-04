package bug.frontstage.test_case.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import bug.frontstage.notice_manage.model.Notify_Comment;
import bug.frontstage.test_case.model.TestCase;
import bug.frontstage.test_case.model.TestGroup;



public class TestCaseDao {


	

		@Autowired(required=false)
	    @Resource(name = "jdbcTemplate")  
		private JdbcTemplate jdbcTemplate;

		public JdbcTemplate getJdbcTemplate() {
			return jdbcTemplate;
		}

		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
			this.jdbcTemplate = jdbcTemplate;
		}
		
		//查询当前用户名
		public String showName(int id){
			String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{id},java.lang.String.class);
			return name;
					
		}
		//查询当前用户名
		public String showGroupName(int id){
			String name = (String)jdbcTemplate.queryForObject("select group_name from test_group  where group_id=?", new Object[]{id},java.lang.String.class);
			return name;
							
		}
		//查询当前用户名
		public String showProduceName(int id){
			String name = (String)jdbcTemplate.queryForObject("select produce_name from produce where produce_id=?", new Object[]{id},java.lang.String.class);
			return name;
									
		}
		//查询该项目所有测试用例
		public List<Map<String,Object>> showAllTestCase(int pid,String currpage,String everycount){
			List<Map<String, Object>> list =new ArrayList<>();
			String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
			String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
			list = jdbcTemplate.queryForList("select  *  from (select rownum as num,case_id,group_id,produce_id,case_title,case_state,case_prop,case_manager,case_creater,case_content,case_photo,case_fu,case_fu_name,case_create_date,case_update_date,program_id,case_updater from (select * from test_case order by case_create_date desc) where program_id = " + pid+"and  rownum<='"+end+"'  ) where num>='"+begin+"'");
			int i = 0;
			for(Map<String,Object> map : list){
				Object pro =list.get(i).get("case_prop");
				int prop = Integer.parseInt(String.valueOf(pro));
				if(prop == 2){
					map.put("prop_name", "高");
				}else if(prop == 2){
					map.put("prop_name", "中");
				}else{
					map.put("prop_name", "低");
				}
				Object cid =list.get(i).get("case_creater");
				int createrId = Integer.parseInt(String.valueOf(cid));
				String createrName = showName(createrId);
				map.put("creater_name", createrName);
				Object mid =list.get(i).get("case_manager");
				int managerId = Integer.parseInt(String.valueOf(mid));
				String managerName = showName(managerId);
				map.put("manager_name", managerName);
				Object prodid =list.get(i).get("produce_id");
				int produceId = Integer.parseInt(String.valueOf(prodid));
				if(produceId == 0){
					map.put("produce_name", "");
				}else{
					
					String produceName = showProduceName(produceId);
					map.put("produce_name", produceName);
				}
				
				Object gid =list.get(i).get("group_id");
				int groId = Integer.parseInt(String.valueOf(gid));
				if(groId == 0){
					map.put("group_name", "");
				}else{
					String groupName = showGroupName(groId);
					map.put("group_name", groupName);
				}
				i++;
			}
			
			return list;
		}
		//查询该项目所有测试用例数量
		public int countTestCase(int pid)	{
			
			List<Map<String,Object>>  list = jdbcTemplate.queryForList("select *  from test_case  where  program_id=?",new Object[]{pid});   
			return list.size();
		}
		//查询某条用例信息
		public List<Map<String,Object>> showOneTestCase(int cid){
		List <Map<String,Object>> list = jdbcTemplate.queryForList("select  *  from test_case where case_id = " + cid);

		int i = 0;
		for(Map<String,Object> map : list){
			Object pro =list.get(i).get("case_prop");
			int prop = Integer.parseInt(String.valueOf(pro));
			if(prop == 2){
				map.put("prop_name", "高");
			}else if(prop == 1){
				map.put("prop_name", "中");
			}else{
				map.put("prop_name", "低");
			}
			Object crid =list.get(i).get("case_creater");
			int createrId = Integer.parseInt(String.valueOf(crid));
			String createrName = showName(createrId);
			map.put("creater_name", createrName);
			Object mid =list.get(i).get("case_manager");
			int managerId = Integer.parseInt(String.valueOf(mid));
			String managerName = showName(managerId);
			map.put("manager_name", managerName);
			Object prodid =list.get(i).get("produce_id");
			int produceId = Integer.parseInt(String.valueOf(prodid));
			if(produceId == 0){
				map.put("produce_name", "");
			}else{
				
				String produceName = showProduceName(produceId);
				map.put("produce_name", produceName);
			}
			
			Object gid =list.get(i).get("group_id");
			int groId = Integer.parseInt(String.valueOf(gid));
			if(groId == 0){
				map.put("group_name", "");
			}else{
				String groupName = showGroupName(groId);
				map.put("group_name", groupName);
			}
			
			i++;
		}
		return list;
		}
		
		//发布用例信息
		public void addTestCase(TestCase testCase){
			jdbcTemplate.update("insert into test_case(case_id,group_id,produce_id,case_title,case_state,case_prop,case_manager,case_creater,case_content,case_photo,case_fu,case_fu_name,case_create_date,case_update_date,program_id,case_updater) values(SEQ_TEST_CASE.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",new Object[]{testCase.getGroupId(),testCase.getProduceId(),testCase.getTitle(),testCase.getState(),testCase.getProp(),testCase.getManagerId(),testCase.getCreaterId(),testCase.getContent(),testCase.getPhoto(),testCase.getFile(),testCase.getFileName(),new Timestamp(System.currentTimeMillis()),new Timestamp(System.currentTimeMillis()),testCase.getProgramId(),testCase.getUpdaterId()} );
				
		}
		
		//修改通知信息
		public void updateTestCase(TestCase testCase){
			jdbcTemplate.update("update test_case set group_id = ? ,produce_id = ? ,case_title = ? ,case_state = ? ,case_prop = ? ,case_manager = ? ,case_content = ? ,case_photo = ? ,case_fu = ? ,case_fu_name = ? ,case_update_date = ? ,case_updater = ?  where case_id = ?",new Object[]{testCase.getGroupId(),testCase.getProduceId(),testCase.getTitle(),testCase.getState(),testCase.getProp(),testCase.getManagerId(),testCase.getContent(),testCase.getPhoto(),testCase.getFile(),testCase.getFileName(),new Timestamp(System.currentTimeMillis()),testCase.getUpdaterId(),testCase.getCaseId()});			

		}
		
		//删除某条用例信息
		public void deleteOneCase(int id){
			
			jdbcTemplate.execute("delete from test_case where case_id = "+ id);
		}
		
		//查询测试组
		public List<Map<String,Object>> showTestGroup(int pid){
			List <Map<String,Object>> list = jdbcTemplate.queryForList("select  *  from test_group where program_id = " + pid);

			int i = 0;
			for(Map<String,Object> map : list){
				Object mid =list.get(i).get("group_manager");
				int managerId = Integer.parseInt(String.valueOf(mid));
				String managerName = showName(managerId);
				map.put("manager_name", managerName);
//				Object hid =list.get(i).get("group_higher");
//				int higherId = Integer.parseInt(String.valueOf(hid));
//				String higherName = showName(higherId);
//				map.put("higher_name", higherName);
				i++;
			}
			return list;
		}
		//增加测试组
		public void addTestGroup(TestGroup testGroup){
			jdbcTemplate.update("insert into test_group(group_id,group_name,group_manager,group_higher,program_id) values(SEQ_TEST_GROUP.nextval,?,?,?,?)",new Object[]{testGroup.getGroupName(),testGroup.getManagerId(),testGroup.getHigherId(),testGroup.getProgramId()} );
						
		}
				
		//修改测试组信息
		public void updateTestGroup(TestGroup testGroup){
			jdbcTemplate.update("update test_group set group_name = ? ,group_manager = ? ,group_higher = ?  where group_id = ?",new Object[]{testGroup.getGroupName(),testGroup.getManagerId(),testGroup.getHigherId(),testGroup.getGroupId()});			

		}
				
		//删除某测试组
		public boolean deleteOneGroup(int id){
			boolean result = true;
			try {
				jdbcTemplate.execute("delete from test_group where group_id = "+ id);
			} catch (Exception e) {
				e.printStackTrace();
				result = false;
			}
			return result;
		}
		//查询某测试组
		public List<Map<String,Object>> showOneTestGroup(int gid){
					
			List <Map<String,Object>> list = jdbcTemplate.queryForList("select  *  from test_group where group_id = " + gid);
			return list;
		}
		
		//查询产品
		public List<Map<String,Object>> showProduce(int pid){
			List<Map<String,Object>>  list = jdbcTemplate.queryForList("select produce_id  from  program_produce  where  program_id=?",new Object[]{pid});
			List<Map<String, Object>> list1 =new ArrayList<>();
			for(int i=0;i<list.size();i++){
				Object ob =list.get(i).get("produce_id");
				int  bid = Integer.parseInt(ob.toString());
				List<Map<String,Object>> produce = jdbcTemplate.queryForList(	"select produce_name  from  produce  where produce_id='"+bid+"' ");
			    String   produce_name = (String)  produce.get(0).get("produce_name");
			    Map<String ,Object> map =new HashMap<String ,Object>();
			    map.put("produce_id", bid);
			    map.put("produce_name", produce_name);
			    list1.add(map);
			}	
			return list1;
		}
		
//		public List<Map<String,Object>> showProduce(int pid){
//			
//			List <Map<String,Object>> list = jdbcTemplate.queryForList("select  *  from produce where program_id = " + pid);
//			return list;
//		}
		//查询组员
		public List<Map<String,Object>> showProgramMemberList(int pid){
	
			List <Map<String,Object>> list = jdbcTemplate.queryForList("select  buser_id  from program_buser where program_id = " + pid);
			int i = 0;
			for(Map<String,Object> map : list){
				Object busId =list.get(i).get("buser_id");
				int bid = Integer.parseInt(String.valueOf(busId));
				String name = showName(bid);
				map.put("buser_name", name);
				
				i++;
			}
			return list;
		}
		
		
		
		/*               筛选                                          */
		//测试用例：筛选条件
		public String testCaseFilter(String group,String prop,String manager,String state,String produce,int pid){
			String toGroup,toProp,toManager,toState,toProduce;

				if(group.equals("全部")){
					toGroup = " ";
				}else if(group.equals("[无]")){
					toGroup = " group_id = 0 and ";
				}else{
					int  gid = jdbcTemplate.queryForObject("select  group_id from test_group where group_name = '" + group +"' ", Integer.class);
					toGroup = " group_id = " + gid +" and ";
				}
				if(prop.equals("全部")){
					toProp = " ";
				}else{
					if(prop.equals("高")){
						toProp = " case_prop = 2 and ";	
					}else if(prop.equals("中")){
						toProp = " case_prop = 1 and ";	
					}else{
						toProp = " case_prop = 0 and ";	
					}		
				}
				if(manager.equals("全部")){
					toManager = " ";
				}else if(manager.equals("[未指定]")){
					toManager = " case_manager = 0 and ";
				}else{
					int  mid = jdbcTemplate.queryForObject("select  buser_id from buser where buser_name = '" + manager +"' ", Integer.class);
					toManager = " case_manager = " + mid +" and ";
				}
				if(state.equals("全部")){
					toState = " ";
				}else{
					toState = " case_state = '" + state +"' and ";
				}
				if(produce.equals("全部")){
					toProduce = " ";
				}else if(produce.equals("[未指定]")){
					toProduce = " produce_id = 0 and ";
				}else{
					int  prodid = jdbcTemplate.queryForObject("select  produce_id from produce where produce_name = '" + produce +"' and program_id = "+pid, Integer.class);
					toProduce = " produce_id = '" + prodid +"' and ";
				}
				return toGroup+toProp+toManager+toState+toProduce;
			}	
		// 筛选：查询该项目测试用例
		public List<Map<String,Object>> showFilterTestCase(String groupF,String propF,String managerF,String stateF,String produceF,int pid,String currpage,String everycount){
			String condition = testCaseFilter(groupF, propF, managerF, stateF,produceF,pid);
			List<Map<String, Object>> list =new ArrayList<>();
			String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
			String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
			list = jdbcTemplate.queryForList("select  *  from (select rownum as num,case_id,group_id,produce_id,case_title,case_state,case_prop,case_manager,case_creater,case_content,case_photo,case_fu,case_fu_name,case_create_date,case_update_date,program_id,case_updater from (select * from test_case order by case_create_date desc) where "+ condition+ " program_id = " + pid+"and  rownum<='"+end+"'  ) where num>='"+begin+"'");
			int i = 0;
			for(Map<String,Object> map : list){
				Object pro =list.get(i).get("case_prop");
				int prop = Integer.parseInt(String.valueOf(pro));
				if(prop == 2){
					map.put("prop_name", "高");
				}else if(prop == 2){
					map.put("prop_name", "中");
				}else{
					map.put("prop_name", "低");
				}
				Object cid =list.get(i).get("case_creater");
				int createrId = Integer.parseInt(String.valueOf(cid));
				String createrName = showName(createrId);
				map.put("creater_name", createrName);
				Object mid =list.get(i).get("case_manager");
				int managerId = Integer.parseInt(String.valueOf(mid));
				String managerName = showName(managerId);
				map.put("manager_name", managerName);
				Object prodid =list.get(i).get("produce_id");
				int produceId = Integer.parseInt(String.valueOf(prodid));
				if(produceId == 0){
					map.put("produce_name", "");
				}else{
					
					String produceName = showProduceName(produceId);
					map.put("produce_name", produceName);
				}
						
				Object gid =list.get(i).get("group_id");
				int groId = Integer.parseInt(String.valueOf(gid));
				if(groId == 0){
					map.put("group_name", "");
				}else{
					String groupName = showGroupName(groId);
					map.put("group_name", groupName);
				}
				i++;
			}
					
			return list;
		}
		
		//根据通知类型和创建者筛选后的数量
		public int countTestCaseFilter(String groupF,String propF,String managerF,String stateF,String produceF,int pid){
			List<Map<String, Object>> list =new ArrayList<>();	

			String condition = testCaseFilter(groupF, propF, managerF, stateF,produceF,pid);
			list = jdbcTemplate.queryForList("select  *  from test_case where "+condition+" program_id = "+pid);
			return list.size();
		}
		//管理员列表
	public List<Map<String,Object>> managerFilterList(String groupF,String propF,String stateF,String produceF,int pid){
					
		List<Map<String, Object>> list =new ArrayList<>();
		String condition = testCaseFilter(groupF, propF, "全部", stateF,produceF,pid);				
		list = jdbcTemplate.queryForList("select distinct case_manager  from test_case where "+condition+" case_manager<>0 and program_id = "+pid);
		int i = 0;
		for(Map<String,Object> map : list){
			Object busId =list.get(i).get("case_manager");
			int buserId = Integer.parseInt(String.valueOf(busId));
			String name = showName(buserId);
			map.put("manager_name", name);

			i++;
		}	
				
		return list;
	}
	//测试组列表
	public List<Map<String,Object>> goupFilterList(String managerF,String propF,String stateF,String produceF,int pid){
					
		List<Map<String, Object>> list =new ArrayList<>();
		String condition = testCaseFilter("全部", propF, managerF, stateF,produceF,pid);				
		list = jdbcTemplate.queryForList("select distinct group_id  from test_case where "+condition+" group_id<>0 and  program_id = "+pid);
		int i = 0;
		for(Map<String,Object> map : list){
			Object a =list.get(i).get("group_id");
			int id = Integer.parseInt(String.valueOf(a));
			
			String name = showGroupName(id);
			map.put("group_name", name);
			
			
			i++;
		}	
				
		return list;
	}
	//产品模块列表
	public List<Map<String,Object>> produceFilterList(String groupF,String managerF,String propF,String stateF,int pid){
						
			List<Map<String, Object>> list =new ArrayList<>();
			String condition = testCaseFilter(groupF, propF, managerF, stateF,"全部",pid);				
			list = jdbcTemplate.queryForList("select distinct produce_id  from test_case where "+condition+" produce_id<>0 and program_id = "+pid);
			int i = 0;
			for(Map<String,Object> map : list){
				Object a =list.get(i).get("produce_id");
				int id = Integer.parseInt(String.valueOf(a));
				
				String name = showProduceName(id);
				map.put("produce_name", name);
				
				
				i++;
			}	
					
			return list;
		}
	//查询相关BUg
	public   List<Map<String,Object>>  showCaseBug(int pid,int cid){

		List<Map<String, Object>> list =new ArrayList<>();
		
		list = jdbcTemplate.queryForList("select  * from bug where (program_id ="+pid+" and case_id = "+cid+" ) order by bug_create_date desc");
				
	return list;
	}	
	
	//查询测试组中用例
		public int showByGroupId(int gid)	{
					
			List<Map<String,Object>>  list = jdbcTemplate.queryForList("select *  from test_case  where group_id = ? ",new Object[]{gid});   
			return list.size();
		}
	
}