package bug.frontstage.notice_manage.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bug.frontstage.notice_manage.model.Notify_Comment;

public interface ICommentNotyService {
	//显示所有评论
	public List<Map<String,Object>> showAllNotifyComment(int notyId);
	//添加评论
	public void addNotifyComment(Notify_Comment notyComm);
	//删除一条评论
	public void deleteOneNotyComm(int commId);
	//删除某条通知所有评论
	public void deleteNotyComm(int notyId);
	//删除某项目所有评论
	public void deleteProNotyComm(int pid);
	//修改评论
	public void updateNotifyComment(Notify_Comment notyComm);
	
}
