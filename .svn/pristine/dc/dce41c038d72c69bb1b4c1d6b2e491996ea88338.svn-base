package bug.frontstage.mytask.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class MyTaskDao {


	@Autowired(required=false)
    @Resource(name = "jdbcTemplate")  
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	//查询共计条数
	public String totalDao(){		
		String value =(String)jdbcTemplate.queryForObject("select count(*) a  from employee",String.class);
		return value;
	}
			
	
			
			
	//查询我的待办
	public List<Map<String,Object>>needToDo(int bid,int pid,String currpage,String everycount){
		List<Map<String, Object>> list =new ArrayList<>();
		String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
		String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		list = jdbcTemplate.queryForList("select *  from (select rownum as num,bug_id,bug_type,bug_title,bug_state,bug_prop,bug_maker,bug_signer,bug_plan_date,bug_lasted_date,bug_repair_date,bug_create_date,bug_describe,bug_update,bug_fu,bug_toman  from (select * from bug order by bug_create_date desc ) where bug_toman = '" + name +"' and program_id = "+ pid + " and bug_state not in('已拒绝','已延期','已关闭') and rownum<='"+end+"') where num>='"+begin+"'");
		
		return list;
	}
	

	//查询我的待办数量
	public int countNeedToDo(int bid,int pid){
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		int  count = jdbcTemplate.queryForObject("select  count(*) from bug where bug_toman = '" + name +"' and program_id = "+ pid + "and bug_state not in('已拒绝','已延期','已关闭')", Integer.class);
		return count;
	}
	
	
	
	
	//查询分配给我：我的任务
	public List<Map<String,Object>>myAllTask(int bid,int pid,String currpage, String  everycount){
		List<Map<String, Object>> list =new ArrayList<>();
		String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
		String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		list = jdbcTemplate.queryForList("select *  from (select rownum as num,bug_id,bug_type,bug_title,bug_state,bug_prop,bug_maker,bug_signer,bug_plan_date,bug_lasted_date,bug_repair_date,bug_create_date,bug_describe,bug_fu,bug_update,bug_toman  from (select * from bug order by bug_create_date desc ) where bug_toman = '" + name +"' and program_id = "+ pid+" and rownum<='"+end+"') where num>='"+begin+"'");
		return list;
	}


	//查询分配给我数量：我的任务
	public int countMyAllTask(int bid,int pid){
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		List <Map<String,Object>>list = jdbcTemplate.queryForList("select  *  from bug where bug_toman = '" + name +"' and program_id = "+ pid );
		return list.size();
	}
	
	
	
	
	//查询我的分配
	public List<Map<String,Object>>assignOthers(int bid,int pid,String currpage, String  everycount){
		List<Map<String, Object>> list =new ArrayList<>();
		String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
		String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
		list = jdbcTemplate.queryForList("select *  from (select rownum as num,bug_id,bug_type,bug_title,bug_state,bug_prop,bug_maker,bug_signer,bug_plan_date,bug_lasted_date,bug_repair_date,bug_create_date,bug_describe,bug_fu,bug_update,bug_toman  from (select * from bug order by bug_create_date desc ) where buser_id = " + bid +" and program_id = "+ pid+" and rownum<='"+end+"') where num>='"+begin+"'");
		return list;
	}

	//查询我的分配数量
	public int countAssignOthers(int bid,int pid){
		List <Map<String,Object>>list = jdbcTemplate.queryForList("select  *  from bug where buser_id = " + bid +" and program_id = "+ pid);
		return list.size();
	}
	//我的待办：筛选条件
	public String toStringNeed(String type ,String state,String prop,int bid){
		String toType,toState,toProp;
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		String toMan = " bug_toman = '" + name +"' and ";
		if(type.equals("全部")){
			toType = " ";
		}else{
			toType = " bug_type = '" + type +"' and ";
		}
		if(state.equals("全部活动")){
			toState = " ";
		}else if(state.equals("已拒绝")){
			toState = " bug_state in('不是错误','延期解决','设计如此','不同意建议') and ";	
		}else{
			toState = " bug_state = '" + state +"' and ";		
		}if(prop.equals("全部")){
			toProp = " ";
		}else{
			toProp = " bug_prop = '" + prop +"' and ";
		}
		return toType+toState+toProp+toMan;
	}
	//我的待办：筛选
	public List<Map<String,Object>> filterNeedToDo(String type ,String state,String prop,int bid,int pid,String currpage,String everycount){
		String  condition = toStringNeed(type, state, prop,bid);
		List<Map<String, Object>> list =new ArrayList<>();
		String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
		String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
		list = jdbcTemplate.queryForList("select *  from (select rownum as num,bug_id,bug_type,bug_title,bug_state,bug_prop,bug_maker,bug_signer,bug_plan_date,bug_lasted_date,bug_repair_date,bug_create_date,bug_describe,bug_fu,bug_update,bug_toman  from (select * from bug order by bug_create_date desc ) where " +condition+" program_id = "+ pid+" and rownum<='"+end+"') where num>='"+begin+"'");
		return list;			
	}
	//我的待办：Bug筛选后数量
	public int countFilterNeedToDo(String type ,String state,String prop,int bid,int pid){
		List<Map<String, Object>> list =new ArrayList<>();
		String  condition = toStringNeed(type, state, prop,bid);
		list = jdbcTemplate.queryForList("select *  from bug where "+condition+" program_id = "+ pid );
		return list.size();
	}
	//分配给我：筛选条件
	public String toStringMyTask(String type ,String state,String prop,String signer,int bid){
		String toType,toState,toProp,toSigner;
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		String toMaker = " bug_maker = '" + name +"' and ";
			if(type.equals("全部")){
				toType = " ";
			}else{
				toType = " bug_type = '" + type +"' and ";
			}
			if(state.equals("全部")){
				toState = " ";
			}else if(state.equals("已拒绝")){
				toState = " bug_state in('不是错误','延期解决','设计如此','不同意建议') and ";	
			}else{
				toState = " bug_state = '" + state +"' and ";		
			}
			if(prop.equals("全部")){
				toProp = " ";
			}else{
				toProp = " bug_prop = '" + prop +"' and ";
			}
			if(signer.equals("全部")){
				toSigner = " ";
			}else{
				toSigner = " bug_signer = '" + signer +"' and ";
			}
			return toType+toState+toProp+toSigner+toMaker;
		}		
		//分配给我：筛选
		public List<Map<String,Object>> filterMyAllTask(String type ,String state,String prop,String signer,int bid,int pid,String currpage,String everycount){
			String  condition = toStringMyTask(type, state, prop, signer, bid);
			List<Map<String, Object>> list =new ArrayList<>();
			String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
			String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
			list = jdbcTemplate.queryForList("select *  from (select rownum as num,bug_id,bug_type,bug_title,bug_state,bug_prop,bug_maker,bug_signer,bug_plan_date,bug_lasted_date,bug_repair_date,bug_create_date,bug_describe,bug_fu,bug_update,bug_toman  from (select * from bug order by bug_create_date desc ) where "+condition+" program_id = "+ pid+" and rownum<='"+end+"') where num>='"+begin+"'");
			return list;
		}
		//分配给我：Bug筛选后数量
		public int countFilterMyAllTask(String type ,String state,String prop,String signer,int bid,int pid){

			List<Map<String, Object>> list =new ArrayList<>();
			String  condition = toStringMyTask(type, state, prop, signer, bid);
			list = jdbcTemplate.queryForList("select *  from bug where "+condition+" program_id = "+ pid );
			return list.size();
		}
		//分配给我：分配人列表
		public List<Map<String,Object>> myAllTaskMaker(String type ,String state,String prop,int bid,int pid){
			List<Map<String, Object>> list =new ArrayList<>();
			String  condition =toStringMyTask(type, state, prop, "全部", bid);
			list = jdbcTemplate.queryForList("select distinct bug_signer  from bug where "+condition+" program_id = "+ pid);	
			return list;			
		}
	
		
		//我的分配：筛选条件
		public String toStringAssign(String type ,String state,String prop,String maker){
			String toType,toState,toProp,toMaker;
				if(type.equals("全部")){
					toType = " ";
				}else{
					toType = " bug_type = '" + type +"' and ";
				}
				if(state.equals("全部")){
					toState = " ";
				}else if(state.equals("已拒绝")){
					toState = " bug_state in('不是错误','延期解决','设计如此','不同意建议') and ";	
				}else{
					toState = " bug_state = '" + state +"' and ";		
				}
				if(prop.equals("全部")){
					toProp = " ";
				}else{
					toProp = " bug_prop = '" + prop +"' and ";
				}
				if(maker.equals("全部")){
					toMaker = " ";
				}else{
					toMaker = " bug_toman = '" + maker +"' and ";
				}
				return toType+toState+toProp+toMaker;
			}	
		
	//我的分配：筛选
	public List<Map<String,Object>> filterAssignOthers(String type ,String state,String prop,String maker,int bid,int pid,String currpage,String everycount){
		
		List<Map<String, Object>> list =new ArrayList<>();
		String  condition =toStringAssign(type, state, prop, maker);
		String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
		String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		list = jdbcTemplate.queryForList("select *  from (select rownum as num,bug_id,bug_type,bug_title,bug_state,bug_prop,bug_maker,bug_signer,bug_plan_date,bug_lasted_date,bug_repair_date,bug_create_date,bug_describe,bug_fu,bug_update,bug_toman  from (select * from bug order by bug_create_date desc ) where "+condition+" bug_signer = '" + name +"' and program_id = "+ pid+" and rownum<='"+end+"') where num>='"+begin+"'");
		
		return list;
	}
	//我的分配：Bug筛选后数量
	public int countFilterAssignOthers(String type ,String state,String prop,String maker,int bid,int pid){
		List<Map<String, Object>> list =new ArrayList<>();

		String  condition =toStringAssign(type, state, prop, maker);
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		list = jdbcTemplate.queryForList("select *  from bug where "+condition+" bug_signer = '" + name +"' and program_id = "+ pid );

		return list.size();
	}
	//我的分配：处理人列表
	public List<Map<String,Object>> assignOthersMaker(String type ,String state,String prop,int bid,int pid){
		List<Map<String, Object>> list =new ArrayList<>();
		String  condition =toStringAssign(type, state, prop, "全部");
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		list = jdbcTemplate.queryForList("select distinct bug_toman  from bug where "+condition+" bug_signer = '" + name +"' and program_id = "+ pid+" and bug_toman <> '[未指定]'");
		
		return list;			
	}
	
/**
 * 筛选
 * 
 */
	//修改bugpropflag状态
	public void setPropFlag(){
		
		jdbcTemplate.update("update bug set bug_prop_flag = 0 where bug_prop = '急' ");
		jdbcTemplate.update("update bug set bug_prop_flag = 1 where bug_prop = '高' ");
		jdbcTemplate.update("update bug set bug_prop_flag = 2 where bug_prop = '中' ");
		jdbcTemplate.update("update bug set bug_prop_flag = 3 where bug_prop = '低' ");
		
	}
	//我的分配：筛选 --排序：时间
	public List<Map<String,Object>> orderByTime(String type ,String state,String prop,String maker,int bid,int pid,String currpage,String everycount){
			
		List<Map<String, Object>> list =new ArrayList<>();
		String  condition =toStringAssign(type, state, prop, maker);
		String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
		String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		list = jdbcTemplate.queryForList("select *  from (select rownum as num,bug_id,bug_type,bug_title,bug_state,bug_prop,bug_maker,bug_signer,bug_plan_date,bug_lasted_date,bug_repair_date,bug_create_date,bug_describe,bug_fu,bug_update,bug_toman  from (select * from bug order by bug_create_date desc ) where "+condition+" bug_signer = '" + name +"' and program_id = "+ pid+" and rownum<='"+end+"') where num>='"+begin+"'");
			
		return list;
	}
	//我的分配：筛选 --排序：优先级
	public List<Map<String,Object>> orderByProp(String type ,String state,String prop,String maker,int bid,int pid,String currpage,String everycount){
				
		List<Map<String, Object>> list =new ArrayList<>();
		String  condition =toStringAssign(type, state, prop, maker);
		String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
		String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";
		String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{bid},java.lang.String.class);
		list = jdbcTemplate.queryForList("select *  from (select rownum as num,bug_id,bug_type,bug_title,bug_state,bug_prop,bug_maker,bug_signer,bug_plan_date,bug_lasted_date,bug_repair_date,bug_create_date,bug_describe,bug_fu,bug_update,bug_toman  from (select * from bug where order by bug_prop_flag , bug_create_date desc ) where "+condition+" bug_signer = '" + name +"' and program_id = "+ pid+" and rownum<='"+end+"') where num>='"+begin+"'");
				
		return list;
	}
	
	
}
