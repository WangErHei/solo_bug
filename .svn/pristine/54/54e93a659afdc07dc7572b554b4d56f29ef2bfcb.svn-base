package bug.frontstage.notice_manage.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import bug.frontstage.notice_manage.model.Notify;
import bug.frontstage.notice_manage.model.Notify_Comment;



public class NoticeDao {


	

		@Autowired(required=false)
	    @Resource(name = "jdbcTemplate")  
		private JdbcTemplate jdbcTemplate;

		public JdbcTemplate getJdbcTemplate() {
			return jdbcTemplate;
		}

		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
			this.jdbcTemplate = jdbcTemplate;
		}
		
		
		//查询该项目所有通知
		public List<Map<String,Object>>SelectAll(int proId,String currpage,String everycount){
			List<Map<String, Object>> list =new ArrayList<>();
			String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
			String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";	
			list = jdbcTemplate.queryForList("select  *  from (select rownum as num,notify_id,notify_title,notify_type,buser_id,notify_date,notify_content,program_id,notify_photo,notify_fu,notify_fu_name from (select * from notify order by notify_date desc) where program_id = " + proId+"and  rownum<='"+end+"'  ) where num>='"+begin+"'");
			int i = 0;
			for(Map<String,Object> map : list){
				Object busId =list.get(i).get("buser_id");
				int buserId = Integer.parseInt(String.valueOf(busId));
				String name = showName(buserId);
				map.put("buser_name", name);
				i++;
			}
			
			return list;
		}
		//查询该项目所有通知数量
		public int allNotifyNum(int pid)	{
			int number=0;
			List<Map<String,Object>>  list = jdbcTemplate.queryForList("select notify_id  from notify  where  program_id=?",new Object[]{pid});   
			number=list.size();
			return number;
		}
		//查询该项目所有通知
		public List<Map<String,Object>> showIndexNotice(int proId){
			
			List<Map<String,Object>>  list = jdbcTemplate.queryForList("select  *  from (select * from notify order by notify_date desc) where program_id = " + proId +" and rownum<= 5" );
			return list;
		}
		//查询某条通知信息
		public List<Map<String,Object>> showOneNotify(int notifyId){
		List <Map<String,Object>>list = jdbcTemplate.queryForList("select * from notify  where notify_id="+notifyId);
		int i = 0;
		for(Map<String,Object> map : list){
			Object busId =list.get(i).get("buser_id");
			int buserId = Integer.parseInt(String.valueOf(busId));
			String name = showName(buserId);
			map.put("buser_name", name);
			i++;
		}
		return list;
		}
		
		//发布通知信息
		public void addNotify(Notify notify){
			jdbcTemplate.update("insert into notify(notify_id,notify_title,notify_type,buser_id,notify_date,notify_content,program_id,notify_photo,notify_fu,notify_fu_name) values(SEQ_NOTIFY.nextval,?,?,?,?,?,?,?,?,?)",new Object[]{notify.getTitle(),notify.getType(),notify.getBid(),new Timestamp(System.currentTimeMillis()),notify.getContent(),notify.getPid(),notify.getNotify_photo(),notify.getNotify_fu(),notify.getNotify_fu_name()} );
				
		}
		
		//修改通知信息
		public void updateNotify(Notify notify){
			jdbcTemplate.update("update notify set notify_type= ? ,notify_title= ? ,notify_date= ? ,notify_content= ? ,buser_id = ? ,notify_photo = ? , notify_fu = ? , notify_fu_name = ? where notify_id = ?",new Object[]{notify.getType(),notify.getTitle(),new Timestamp(System.currentTimeMillis()),notify.getContent(),notify.getBid(),notify.getNotify_photo(),notify.getNotify_fu(),notify.getNotify_fu_name(),notify.getNotifyId()});			

		}
		
		//删除某条通知信息
		public void delete(int id){
			
			jdbcTemplate.execute("delete from notify where notify_id='"+ id+"'");
		}
		
		//查询当前用户名
		public String showName(int id){
			String name = (String)jdbcTemplate.queryForObject("select buser_name from buser  where buser_id=?", new Object[]{id},java.lang.String.class);
			return name;
			
		}
		
		
		/*               筛选                                          */
		//我的分配：筛选条件
		public String toStringFilter(String typeInfo ,String creater){
			String toType,toCreater;

				if(typeInfo.equals("全部")){
					toType = " ";
				}else{
					toType = " notify_type = '" + typeInfo +"' and ";
				}
				if(creater.equals("全部")){
					toCreater = " ";
				}else{
					int  bid = jdbcTemplate.queryForObject("select  buser_id from buser where buser_name = '" + creater +"' ", Integer.class);

					toCreater = " buser_id = " + bid +" and ";		
				}				
				return toType+toCreater;
			}	
		//根据通知类型和创建者筛选
		public List<Map<String,Object>> showNotyByFilter(String typeInfo ,String creater,int pid,String currpage,String everycount){
			
			List<Map<String, Object>> list =new ArrayList<>();
			String condition = toStringFilter(typeInfo, creater);
			String end = Integer.parseInt(currpage)*Integer.parseInt(everycount)+ "";
			String begin = (Integer.parseInt(currpage)-1)*Integer.parseInt(everycount)+1+"";
			list = jdbcTemplate.queryForList("select  *  from (select rownum as num,notify_id,notify_title,notify_type,buser_id,notify_date,notify_content,program_id,notify_photo,notify_fu,notify_fu_name from (select * from notify order by notify_date desc) where "+condition+" program_id = "+pid+"and  rownum<='"+end+"'  ) where num>='"+begin+"'");
			int i = 0;
			for(Map<String,Object> map : list){
				Object busId =list.get(i).get("buser_id");
				int buserId = Integer.parseInt(String.valueOf(busId));
				String name = showName(buserId);
				map.put("buser_name", name);
				i++;
			}			
			return list;
		}
		
		//根据通知类型和创建者筛选后的数量
		public int countNotyByFilter(String typeInfo ,String creater,int pid){
			List<Map<String, Object>> list =new ArrayList<>();	

			String condition = toStringFilter(typeInfo, creater);
			list = jdbcTemplate.queryForList("select  *  from notify where "+condition+" program_id = "+pid);
			return list.size();
		}
		//创建者列表
	public List<Map<String,Object>> nameList(String typeInfo ,int pid){
					
		List<Map<String, Object>> list =new ArrayList<>();
		String condition = toStringFilter(typeInfo,"全部");					
		list = jdbcTemplate.queryForList("select distinct buser_id  from notify where "+condition+" program_id = "+pid);
		int i = 0;
		for(Map<String,Object> map : list){
			Object busId =list.get(i).get("buser_id");
			int buserId = Integer.parseInt(String.valueOf(busId));
			String name = showName(buserId);
			map.put("buser_name", name);
			i++;
		}	
				
		return list;
	}
	
	
	/**
	 * 
	 * 通知评论
	 */
	//显示所有评论
	public List<Map<String,Object>> showAllNotifyComment(int notyId){
		List<Map<String, Object>> list =new ArrayList<>();
		list = jdbcTemplate.queryForList("select * from comment_notify where notify_id = "+notyId);
		int i = 0;
		for(Map<String,Object> map : list){
			Object busId =list.get(i).get("buser_id");
			int buserId = Integer.parseInt(String.valueOf(busId));
			String name = showName(buserId);
			map.put("buser_name", name);
			i++;
		}
		return list;
	}
	//添加评论
	public void addNotifyComment(Notify_Comment notyComm){
		List<Map<String, Object>> list =new ArrayList<>();
		jdbcTemplate.update("insert into comment_notify(comment_id,notify_id,buser_id,comment_content,comment_date,program_id) values(SEQ_COMMENT_NOTIFY.nextval,?,?,?,?,?)",new Object[]{notyComm.getNotifyId(),notyComm.getBid(),notyComm.getCommContent(),new Timestamp(System.currentTimeMillis()),notyComm.getPid()} );
	}
	//修改评论
	public void updateNotifyComment(Notify_Comment notyComm){
		List<Map<String, Object>> list =new ArrayList<>();
		jdbcTemplate.update("update comment_notify set buser_id = ?,comment_content = ?,comment_date = ? where comment_id = ? ",new Object[]{notyComm.getBid(),notyComm.getCommContent(),new Timestamp(System.currentTimeMillis()),notyComm.getCommId()} );
		
	}
	//删除一条评论
	public void deleteOneNotyComm(int commId){
		List<Map<String, Object>> list =new ArrayList<>();
		jdbcTemplate.execute("delete from comment_notify where comment_id= "+ commId);
		
	}
	//删除某条通知所有评论
	public void deleteNotyComm(int notyId){
		List<Map<String, Object>> list =new ArrayList<>();
		jdbcTemplate.execute("delete from comment_notify where notify_id= "+ notyId);
		
	}
	//删除某项目所有评论
	public void deleteProNotyComm(int pid){
		List<Map<String, Object>> list =new ArrayList<>();
		jdbcTemplate.execute("delete from comment_notify where program_id= "+ pid);
		
	}
	
	//修改评论
	public void comm(int comm_id,String content){
		jdbcTemplate.update("update comment_notify  set comment_content='"+content+"' where comment_id='"+comm_id+"'");
		
	}
	
	//删除评论
	public void  deleteComm(int comm_id){		
		jdbcTemplate.update("delete  from  comment_notify  where comment_id='"+comm_id+"'");
	}
	
	//判断是否是项目负责人
	public  int    right(int  bid,int pid){	
		List<Map<String,Object>>  list = jdbcTemplate.queryForList("select role_id   from  buser_role   where  buser_id='"+bid+"'  and  program_id='"+pid+"' ");
	Object ob  =  list.get(0).get("role_id");
	int role_id = Integer.parseInt(ob.toString());
			if(role_id==1){
			  return 1;
			}
			else{
			return 0;}
	}
	
	//查找姓名
	public  String name(int bid ){
		List<Map<String, Object>>   list = jdbcTemplate.queryForList("select buser_name  from buser where buser_id='"+bid+"'");
		return (String) list.get(0).get("buser_name");
	}
	
	
	
}
