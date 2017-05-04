package bug.frontstage.project_info.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import bug.frontstage.project_info.model.Bug;

public class SelectProgram {
	@Autowired(required=false)
    @Resource(name = "jdbcTemplate")  
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<Map<String,Object>>  programAll(int bid){
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select program_id from program_buser  where buser_id='" + bid + "'  ");
		List<Map<String, Object>> list1 =new ArrayList<>();
		Map<String ,Object> map =null;
		for (int i = 0; i < list.size(); i++) {
			Object ob = list.get(i).get("program_id");
			int pro_id = Integer.parseInt(ob.toString());
			
			List<Map<String, Object>> name = jdbcTemplate.queryForList("select program_name,program_creator  from program   where program_id='" + pro_id + "' ");
			String pname = (String) name.get(0).get("program_name");
			String program_creator = (String) name.get(0).get("program_creator");
		    map =new HashMap<String ,Object>();
			  map.put("pname", pname);
			  map.put("program_creator", program_creator);
			  map.put("pid",pro_id);
			  list1.add(map);
			}
		return list1;
		}
	
	
//添加Bug
	public  void addBug(Bug bug,int program_id,int bid) {
		jdbcTemplate.update("insert into bug(bug_id,bug_title,produce_name,bug_maker,bug_describe,bug_state,bug_prop,bug_signer,bug_type,program_id,buser_id,bug_plan_date,bug_lasted_date,bug_create_date,bug_creator,bug_update,bug_repair_date,bug_photo,bug_environment,bug_fu,bug_fu_name,bug_toman,case_id) values(seq_bug.nextval,?,?,?,?,?,?,?,?,?,?,to_Date('"+bug.getBug_plan_date()+"','yyyy-mm-dd'),to_Date('"+bug.getBug_lasted_date()+"','yyyy-mm-dd'),?,?,?,?,?,?,?,?,?,?)",new Object[]{bug.getBug_title(),bug.getProduce_name(),bug.getBug_maker(),bug.getBug_describe(),bug.getBug_state(),bug.getProp(),bug.getBug_signer(),bug.getBug_type(),program_id,bid,new Date(),bug.getBug_signer(),bug.getBug_signer(),new Date(),bug.getBug_photo(),bug.getBug_environment(),bug.getBug_fu(),bug.getBug_fu_name(),bug.getBug_maker(),bug.getCaseId()} );
		
	}
	
	//查询所有bug
	public List<Map<String,Object>> bug(int bug_id){
		
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select * from bug where bug_id='"+bug_id+"'");
		return list;
	}
	
	public  String programName(int pid){
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select program_name  from program  where program_id='"+pid+"'");
		String name = (String) list.get(0).get("program_name");
		return name;
	}
	
//	public long datediff(Bug bug) throws ParseException{
//		List<Map<String,Object>> list = jdbcTemplate.queryForList("select bug_repair_date  from bug  where  bug_title='"+bug.getBug_title()+"' and  bug_describe='"+bug.getBug_describe()+"'  ");
//		Object ob = list.get(0).get("BUG_REPAIR_DATE");		
//		String date = ob.toString();
//		SimpleDateFormat  sf = new SimpleDateFormat("yyyy-mm-dd");
//		Date  date1  =sf.parse(date);
//		long repair_date  =new Date().getTime()-date1.getTime();
//		return repair_date;
//	}
	
	
	public String buserName(int id){
	List<Map<String,Object>> list =  	jdbcTemplate.queryForList("select buser_name  from  buser  where buser_id='"+id+"' ");
	String name = (String) list.get(0).get("buser_name");
	return name;
	}
	
	//查找所有成员
	public List<Map<String,Object>> selectAllMember(int pid){
		List<Map<String,Object>> list= jdbcTemplate.queryForList("select buser_id  from program_buser  where program_id='"+pid+"' ");

		List<Map<String, Object>> list1 =new ArrayList<>();
		for(int i=0;i<list.size();i++){
			Object ob =list.get(i).get("buser_id");
			int  bid = Integer.parseInt(ob.toString());
			List<Map<String,Object>> name = jdbcTemplate.queryForList("select *  from buser  where buser_id='"+bid+"' ");
		    String  buser_name= (String) name.get(0).get("BUSER_NAME");
		    String  buser_email =(String) name.get(0).get("BUSER_EMAIL");
		    Map<String ,Object> map =new HashMap<String ,Object>();
		    map.put("buser_name", buser_name);
		    map.put("buser_email", buser_email);
		    list1.add(map);
		}	
		return list1;
	}
	
	//查找所有产品模块
		public List<Map<String,Object>> selectAllProduce(int pid){
			List<Map<String,Object>>  list = jdbcTemplate.queryForList("select produce_id  from  program_produce  where  program_id=?",new Object[]{pid});
			List<Map<String, Object>> list1 =new ArrayList<>();
			for(int i=0;i<list.size();i++){
				Object ob =list.get(i).get("produce_id");
				int  bid = Integer.parseInt(ob.toString());
				List<Map<String,Object>> produce = jdbcTemplate.queryForList(	"select produce_name  from  produce  where produce_id='"+bid+"'  order by  produce_id   desc");
			    String   produce_name = (String)  produce.get(0).get("produce_name");
			    Map<String ,Object> map =new HashMap<String ,Object>();
			    map.put("produce_name", produce_name);
			    list1.add(map);
			}	
			return list1;
		}
		
	//删除模块
		public void   deleteP(String name,int pid){
			List<Map<String,Object>> id  =jdbcTemplate.queryForList("select  produce_id  from produce where program_id='"+pid+"' and  produce_name='"+name+"'  ");
		   Object ob =  id.get(0).get("produce_id");
		   int produce_id = Integer.parseInt(ob.toString());
		   jdbcTemplate.update("delete  from program_produce  where produce_id='"+produce_id+"' ");
		   		
		}
	//删除成员
	  public  void   deleteM(String name,int pid){
			List<Map<String,Object>> id  =jdbcTemplate.queryForList("select buser_id  from buser where   buser_email='"+name+"'  ");
			   Object ob =  id.get(0).get("buser_id");
			   int buser_id = Integer.parseInt(ob.toString());
			   jdbcTemplate.update("delete  from program_buser  where buser_id='"+buser_id+"'  and  program_id='"+pid+"' ");
	  }
	  
	  //判断模块是否被占用
	  public  boolean  isDelete(int pid,String name){
		  List<Map<String,Object>> list =   jdbcTemplate.queryForList("select count(*) a   from  bug  where  program_id='"+pid+"'   and  produce_name='"+name+"'");
		  Object ob  = list.get(0).get("a");
		  int  num = Integer.parseInt(ob.toString());
		  if(num>0){
			  
			  return true;
		  }
		  else{ return false;}
	  }
	  
//	  
//	  public String  singer(int bid,int bug_id,int pid){
//		  
//	  }
	  
	  
	  
	//权限判断
	public String details(int bid, int bug_id, int pid) {
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select  buser_name from  buser  where buser_id='" + bid + "' ");
		String buser_name = (String) list.get(0).get("buser_name");

		List<Map<String, Object>> list1 = jdbcTemplate.queryForList("select bug_toman  from  bug  where bug_id = '" + bug_id + "'");
		String bug_toman = (String) list1.get(0).get("bug_toman");
		
		List<Map<String, Object>> list2 = jdbcTemplate.queryForList("select bug_maker  from  bug  where bug_id = '" + bug_id + "'");
		String bug_maker = (String) list2.get(0).get("bug_maker");
		
		List<Map<String, Object>> list4= jdbcTemplate.queryForList("select bug_signer  from  bug  where bug_id = '" + bug_id + "'");
		String bug_signer = (String) list4.get(0).get("bug_signer");
	
		
		if (buser_name.equals(bug_toman)) {
			return "1";
		}
		if (bug_toman.equals("[未指定]")|| buser_name.equals(bug_signer)) {
			return "0";
		}
		if (buser_name.equals(bug_signer)) {
			return "3";
		}
       else if (buser_name.equals(bug_maker)) {
			return "2";
		}
		return "-1";

	}
		
	//状态
	public String state(int bug_id){
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select  bug_state  from  bug  where  bug_id='"+bug_id+"' ");
		String state = (String) list.get(0).get("bug_state");
		return state;
		}
	
		
//	public  int   right(int  bid,int pid,int bug_id ){	
//		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select  role_id  from  buser_role  where  program_id='"+pid+"' and  buser_id='"+bid+"'");
//			Object ob = list.get(0).get("role_id");
//		int role_id =Integer.parseInt( ob.toString());
//	return role_id;
//	}
		//判断是项目负责人还是成员
	public  int    right(int  bid,int pid,int bug_id ){	
			List<Map<String,Object>>  list = jdbcTemplate.queryForList("select role_id   from  buser_role   where  buser_id='"+bid+"'  and  program_id='"+pid+"' ");
		Object ob  =  list.get(0).get("role_id");
		int role_id = Integer.parseInt(ob.toString());
				if(role_id==1){
				  return 1;
				}
				else{
				return 0;}
		}
	
//bug类型	
public  String  bugType(int bug_id){
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select  bug_type from  bug  where  bug_id='"+bug_id+"' ");
		String type = (String) list.get(0).get("bug_type");
		return type;
		
}
	
	
/*
 * Bug 流程
 * */
	public   List<Map<String,Object>> log(int bug_id){
		 return jdbcTemplate.queryForList("select  * from  comments  where bug_id='"+bug_id+"'  order by  comments_date  desc");
		 
	}
	
	
	//评论
	public  void  comments(int  bug_id,int bid,String photo,String content,String fu,String fu_name ){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name  = (String) list.get(0).get("buser_name");
		jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name,bug_id});
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,comments_photo,comments_fu,comments_fu_name,buser_name)  values(seq_comments.nextval,'"+bug_id+"','"+bid+"','"+content+"',?,'"+photo+"','"+fu+"','"+fu_name+"',?)",new  Object[]{new Date(),buser_name+"评论:"});
		
	}
	
	//指派
	public  void sign(String buser_name,int bug_id,String content,int bid,String photo,String fu,String fu_name ){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name1  = (String) list.get(0).get("buser_name");	
		List <Map<String ,Object>> list1= jdbcTemplate.queryForList("select  bug_state  from  bug  where bug_id='"+bug_id+"'");
		String bug_state  = (String) list1.get(0).get("bug_state");	
		List <Map<String ,Object>> list2= jdbcTemplate.queryForList("select  bug_maker  from  bug  where bug_id='"+bug_id+"'");
		String bug_maker  = (String) list2.get(0).get("bug_maker");	
		if(bug_state.equals("未解决") ||bug_maker.equals("[未指定]"))
			{
				jdbcTemplate.update("update  bug   set  bug_maker='"+buser_name+"' where  bug_id='"+bug_id+"'");
				}
			jdbcTemplate.update("update  bug   set  bug_toman='"+buser_name+"' where  bug_id='"+bug_id+"'");			
			jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
			jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name1,bug_id});
			jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name,comments_photo,comments_fu,comments_fu_name)  values(seq_comments.nextval,?,?,?,?,?,?,?,?)",new  Object[]{bug_id,bid,"备注:"+content,new Date(),buser_name1+"指派"+buser_name,photo,fu,fu_name});
		}

	
	//关闭
	public void  close(int  bug_id,String content,int bid){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name  = (String) list.get(0).get("buser_name");	
		jdbcTemplate.update("update  bug   set  bug_state=?  where  bug_id='"+bug_id+"'",new Object[]{"已关闭"});
		jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name,bug_id});
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name)  values(seq_comments.nextval,?,?,?,?,?)",new  Object[]{bug_id,bid,"备注:"+content,new Date(),buser_name+"关闭"});

	}
	
	//修复
	public  void repair(String buser_name,int bug_id,String content,int bid,String photo,String fu,String fu_name){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name1  = (String) list.get(0).get("buser_name");	
		List <Map<String ,Object>> list1= jdbcTemplate.queryForList("select  bug_maker  from  bug  where bug_id='"+bug_id+"'");
		String bug_maker  = (String) list1.get(0).get("bug_maker");	
		if(bug_maker.equals("[未指定]") )
			{
				jdbcTemplate.update("update  bug   set  bug_maker='"+buser_name+"' where  bug_id='"+bug_id+"'");
				}
			jdbcTemplate.update("update  bug   set  bug_toman='"+buser_name+"' where  bug_id='"+bug_id+"'");
			jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
			jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name1,bug_id});
			jdbcTemplate.update("update  bug   set  bug_state=?  where  bug_id='"+bug_id+"'",new Object[]{"待审核"});
			jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name,comments_photo,comments_fu,comments_fu_name)  values(seq_comments.nextval,?,?,?,?,?,?,?,?)",new  Object[]{bug_id,bid,"备注:"+content,new Date(),buser_name1+"修复,"+"指派"+buser_name,photo,fu,fu_name});

		}

	//延期
	public void push(int  bug_id,String content,int bid){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name  = (String) list.get(0).get("buser_name");	
		jdbcTemplate.update("update  bug   set  bug_state=?  where  bug_id='"+bug_id+"'",new Object[]{"已延期"});
		jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name,bug_id});
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name)  values(seq_comments.nextval,?,?,?,?,?)",new  Object[]{bug_id,bid,"备注:"+content,new Date(),buser_name+"延期"});

	}
	
	//再打开
	public void again(String buser_name,int bug_id,String content,int bid,String photo,String fu,String fu_name){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name1  = (String) list.get(0).get("buser_name");	
		jdbcTemplate.update("update  bug   set  bug_signer=?  where  bug_id='"+bug_id+"'",new Object[]{buser_name1});
		jdbcTemplate.update("update  bug   set  bug_maker=?  where  bug_id='"+bug_id+"'",new Object[]{buser_name});
		jdbcTemplate.update("update  bug   set  bug_state=?  where   bug_id='"+bug_id+"'",new Object[]{"未解决"});
		jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name1,bug_id});
		jdbcTemplate.update("update  bug   set  bug_toman='"+buser_name+"' where  bug_id='"+bug_id+"'");
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name,comments_photo,comments_fu,comments_fu_name)  values(seq_comments.nextval,?,?,?,?,?,?,?,?)",new  Object[]{bug_id,bid,"备注:"+content,new Date(),buser_name1+"再打开,"+"指派"+buser_name,photo,fu,fu_name});

	}
	
	//通过
	public void  pass(int bug_id,String content,int bid,String photo,String fu,String fu_name){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name1  = (String) list.get(0).get("buser_name");
		jdbcTemplate.update("update  bug   set  bug_state=?  where   bug_id='"+bug_id+"'",new Object[]{"已解决"});
		jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name1,bug_id});
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name,comments_photo,comments_fu,comments_fu_name)  values(seq_comments.nextval,?,?,?,?,?,?,?,?)",new  Object[]{bug_id,bid,"备注:"+content,new Date(),buser_name1+"审核通过",photo,fu,fu_name});
	}

	//不通过
	public void  notPass(int bug_id,String content,int bid,String photo,String fu,String fu_name){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name1  = (String) list.get(0).get("buser_name");
		List <Map<String ,Object>> list1 = jdbcTemplate.queryForList("select  bug_maker  from  bug  where bug_id='"+bug_id+"'");
		String buser_name  = (String) list1.get(0).get("bug_maker");
		jdbcTemplate.update("update  bug   set  bug_toman=?  where   bug_id='"+bug_id+"'",new Object[]{buser_name});
		jdbcTemplate.update("update  bug   set  bug_state=?  where   bug_id='"+bug_id+"'",new Object[]{"未解决"});
		jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name1,bug_id});
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name,comments_photo,comments_fu,comments_fu_name)  values(seq_comments.nextval,?,?,?,?,?,?,?,?)",new  Object[]{bug_id,bid,"备注:"+content,new Date(),buser_name1+"审核不通过",photo,fu,fu_name});
	}
	
	//拒绝
	public void  refuse(String buser_name,String reason,int bug_id,String content,int bid,String photo,String fu,String fu_name){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name1  = (String) list.get(0).get("buser_name");
		List <Map<String ,Object>> list1= jdbcTemplate.queryForList("select  bug_maker  from  bug  where bug_id='"+bug_id+"'");
		String bug_maker  = (String) list1.get(0).get("bug_maker");	
		if(bug_maker.equals("[未指定]") )
			{
				jdbcTemplate.update("update  bug   set  bug_maker='"+buser_name+"' where  bug_id='"+bug_id+"'");
				}
		jdbcTemplate.update("update  bug   set  bug_state=?  where   bug_id='"+bug_id+"'",new Object[]{reason});
		jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name1,bug_id});
		jdbcTemplate.update("update  bug   set  bug_toman='"+buser_name+"' where  bug_id='"+bug_id+"'");
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name,comments_photo,comments_fu,comments_fu_name)  values(seq_comments.nextval,?,?,?,?,?,?,?,?)",new  Object[]{bug_id,bid,"备注:"+content,new Date(),buser_name1+"拒绝('"+reason+"')"+"指派"+buser_name,photo,fu,fu_name});

	}
	
	//完成
	public void done(String buser_name,int bug_id,String content,int bid,String photo,String fu,String fu_name){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name1  = (String) list.get(0).get("buser_name");
		List <Map<String ,Object>> list1= jdbcTemplate.queryForList("select  bug_maker  from  bug  where bug_id='"+bug_id+"'");
		String bug_maker  = (String) list1.get(0).get("bug_maker");	
		if(bug_maker.equals("[未指定]") )
			{
				jdbcTemplate.update("update  bug   set  bug_maker='"+buser_name+"' where  bug_id='"+bug_id+"'");
				}	
		jdbcTemplate.update("update  bug   set  bug_toman='"+buser_name+"' where  bug_id='"+bug_id+"'");
		jdbcTemplate.update("update  bug   set  bug_state=?  where   bug_id='"+bug_id+"'",new Object[]{"待审核"});
		jdbcTemplate.update("update  bug   set  bug_repair_date=?  where  bug_id=?",new Object[]{new Date(),bug_id});
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name1,bug_id});
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_content,comments_date,buser_name,comments_photo,comments_fu,comments_fu_name)  values(seq_comments.nextval,?,?,?,?,?,?,?,?)",new  Object[]{bug_id,bid,content,new Date(),buser_name1+"完成,"+"指派"+buser_name,photo,fu,fu_name});

	}
	
	//删除
	public void delete(int bug_id){	
	jdbcTemplate.update("delete  from   bug   where   bug_id='"+bug_id+"'");
	}
	
	//获取修改bug内容
	public List<Map<String,Object>> updateBug(int  bug_id)
	{
		List<Map<String,Object>> updatebug = 	jdbcTemplate.queryForList("select  *  from  bug  where  bug_id='"+bug_id+"'");
		return updatebug;
	}
	
	//对修改bug进行提交
	public void  updateSubmit(int bug_id,Bug bug,int pid,int bid ){
		List <Map<String ,Object>> list = jdbcTemplate.queryForList("select  buser_name  from  buser  where buser_id='"+bid+"'");
		String buser_name1  = (String) list.get(0).get("buser_name");
		jdbcTemplate.update("update  bug   set  bug_update=?  where  bug_id=?",new Object[]{buser_name1,bug_id});
		jdbcTemplate.update("update bug   set bug_title=?,produce_name=?,bug_maker=?,bug_describe=?,bug_prop=?,bug_signer=?,bug_type=?,buser_id=?,bug_plan_date=to_Date('"+bug.getBug_plan_date()+"','yyyy-mm-dd'),bug_lasted_date=to_Date('"+bug.getBug_lasted_date()+"','yyyy-mm-dd'),bug_update=?,bug_repair_date=?,bug_photo=?,bug_environment=?,bug_fu=?,bug_fu_name=?,bug_toman=?  where bug_id='"+bug_id+"' ",new Object[]{bug.getBug_title(),bug.getProduce_name(),bug.getBug_maker(),bug.getBug_describe(),bug.getProp(),bug.getBug_signer(),bug.getBug_type(),bid,buser_name1,new Date(),bug.getBug_photo(),bug.getBug_environment(),bug.getBug_fu(),bug.getBug_fu_name(),bug.getBug_maker()});
		jdbcTemplate.update("insert into  comments(comments_id,bug_id,buser_id,comments_date,buser_name)  values(seq_comments.nextval,?,?,?,?)",new  Object[]{bug_id,bid,new Date(),buser_name1+"进行了修改"});

	}
	
	//查找用户对应的头像
	public  String  head(int bid){
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select  buser_head  from  buser  where  buser_id='"+bid+"'");
		String head  = (String) list.get(0).get("buser_head");
		return head;
	}
	
	//获取bug评论内容
	public  List<Map<String, Object>>  comm(int comm_id){
		List<Map<String,Object>> comm = 	jdbcTemplate.queryForList("select  *  from  comments  where  comments_id='"+comm_id+"'");
       return   comm;
	}
	
	//更新bug评论内容
	public void commSub(String content,String photo,String fu,String fu_name,int comm_id){
		jdbcTemplate.update("update comments  set comments_content=?,comments_photo=?,comments_fu=?,comments_fu_name=?  where comments_id=?",new Object[]{ content, photo,fu, fu_name, comm_id});
	}
	
  //删除bug的评论
	public void delComm(int comm_id){
		jdbcTemplate.update("update comments set comments_content=?,comments_photo=?,comments_fu=?,comments_fu_name=?  where comments_id=? ",new Object[]{null,null,null,null,comm_id});	
	}
	
}
