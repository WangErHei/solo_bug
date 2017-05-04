package bug.frontstage.login.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import bug.frontstage.login.model.Buser;



public class Login {
	@Autowired(required=false)
    @Resource(name = "jdbcTemplate")  
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	
	public int loginDao(Buser buser) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select buser_email,buser_pass from buser  where buser_email=? and buser_pass=?", new Object[]{buser.getBuser_email(),buser.getBuser_pass()});
		int i=list.size();
		return i;
		
	}
	
	public List<Map<String,Object>> slectName(int id){
		List<Map<String,Object>>  list =  jdbcTemplate.queryForList("select buser_name from buser where buser_id ='"+id+"'");
		return list;
	}
	
	public String slectHead(int id){
		List<Map<String,Object>>  list =  jdbcTemplate.queryForList("select buser_head from buser where buser_id ='"+id+"'");
		String head=(String) list.get(0).get("buser_head");
		return head;
	}
	
	public int getId(Buser buser){
		List<Map<String,Object>> list= jdbcTemplate.queryForList("select buser_id from buser  where buser_email=? and buser_pass=?", new Object[]{buser.getBuser_email(),buser.getBuser_pass()});
		Object ob =list.get(0).get("buser_id");
		int  i = Integer.parseInt(ob.toString());
		return i;
	}
	
	// 查询所有项目
	public List<Map<String,Object>>  programAll(int bid){
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select program_id from program_buser  where buser_id='" + bid + "'  ");
		List<Map<String, Object>> list1 =new ArrayList<>();
		Map<String ,Object> map =null;
		for (int i = 0; i < list.size(); i++) {
			Object ob = list.get(i).get("program_id");
			int pro_id = Integer.parseInt(ob.toString());
	     	List<Map<String, Object>> name = jdbcTemplate.queryForList("select program_name   from program   where program_id='" + pro_id + "' ");
			List<Map<String,Object>>  numP= jdbcTemplate.queryForList("select bug_id  from bug  where  program_id=?  and  ( bug_state='未解决' or bug_state='不是错误'  or  bug_state='设计如此'  or  bug_state='不同意建议'  or  bug_state='延期解决'  or bug_state='待审核')  ",new Object[]{pro_id});			
			int pnum = numP.size();
			String pname = (String) name.get(0).get("program_name");
		    map =new HashMap<String ,Object>();
			  map.put("pname", pname);
			  map.put("pid",pro_id);
			  map.put("pnum",pnum);
			  list1.add(map);
			}
		return list1;
		
		}
		
	
	
	//查询项目名称，成员数量，bug状态
		public  String  selectProgramName(int pid){
			List<Map<String,Object>> list = jdbcTemplate.queryForList("select program_name from  program where  program_id='"+pid+"'");
			String program_name = (String) list.get(0).get("program_name");
			return program_name;
		}
	
	
	
	
	// 登陆，查询所有bug状态
	// buser,buser_program,program_bug
	// 待审核，未解决，已延期
	public List<Map<String, Object>> waitCheck(int bid) {
		int a = 0;
		List<Map<String, Object>> list = jdbcTemplate
				.queryForList("select program_id from program_buser where buser_id='" + bid + "' ");
		List<Map<String, Object>> list1 = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Object ob = list.get(i).get("program_id");
			int pro_id = Integer.parseInt(ob.toString());
			List<Map<String, Object>> email = jdbcTemplate.queryForList("select bug_id  from program_bug  where program_id='" + pro_id + "' ");
			for (int j = 0; j < email.size(); j++) {
				String bug_id = (String) email.get(0).get("bug_id");
				jdbcTemplate.queryForList(
						"select count(*)  a  from bug  where bug_id='" + bug_id + "'   and bug_state='待审核'  ");
				if (a > 0) {
					a++;
				}
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("a", a);
			list1.add(map);
		}

		return list1;
	}
		
		
		
		//未解決
		public List<Map<String, Object>> notDo(int bid) {
			int a = 0;
			List<Map<String, Object>> list = jdbcTemplate.queryForList("select program_id from program_buser where buser_id='" + bid + "' ");
			List<Map<String, Object>> list1 = new ArrayList<>();
			for (int i = 0; i < list.size(); i++) {
				Object ob = list.get(i).get("program_id");
				int pro_id = Integer.parseInt(ob.toString());
				List<Map<String, Object>> email = jdbcTemplate.queryForList("select bug_id  from program_bug  where program_id='" + pro_id + "' ");
				for (int j = 0; j < email.size(); j++) {
					String bug_id = (String) email.get(0).get("bug_id");
					jdbcTemplate.queryForList("select count(*)  a  from bug  where bug_id='" + bug_id + "'   and bug_state='未解决'  ");
					if (a > 0) {
						a++;
					}
				}
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("a", a);
			list1.add(map);
			return list1;
		}
		
		
		
		//已延期
		public List<Map<String, Object>> toPush(int bid) {
			int a = 0;
			List<Map<String, Object>> list = jdbcTemplate
					.queryForList("select program_id from program_buser where buser_id='" + bid + "' ");
			List<Map<String, Object>> list1 = new ArrayList<>();
			for (int i = 0; i < list.size(); i++) {
				Object ob = list.get(i).get("program_id");
				int pro_id = Integer.parseInt(ob.toString());
				List<Map<String, Object>> email = jdbcTemplate.queryForList("select bug_id  from program_bug  where program_id='" + pro_id + "' ");
				for (int j = 0; j < email.size(); j++) {
					String bug_id = (String) email.get(0).get("bug_id");
					jdbcTemplate.queryForList("select count(*)  a  from bug  where bug_id='" + bug_id + "'   and bug_state='已延期'  ");
					if (a > 0) {
						a++;
					}
				}
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("a", a);
			list1.add(map);
			return list1;
		}
	
		//查询时间
		public int  selectDate(int pid){
			jdbcTemplate.queryForList("select program_date  from  program  where program ");
			return 0;
	}
		
		//修改bugpropflag状态
		public void setPropFlag(){
			
			jdbcTemplate.update("update bug set bug_prop_flag = 0 where bug_prop = '急' ");
			jdbcTemplate.update("update bug set bug_prop_flag = 1 where bug_prop = '高' ");
			jdbcTemplate.update("update bug set bug_prop_flag = 2 where bug_prop = '中' ");
			jdbcTemplate.update("update bug set bug_prop_flag = 3 where bug_prop = '低' ");
			
		}
}


