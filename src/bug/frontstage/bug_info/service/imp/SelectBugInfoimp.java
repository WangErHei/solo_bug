package bug.frontstage.bug_info.service.imp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.bug_info.dao.Bug;
import bug.frontstage.bug_info.service.SelectBugInfoService;


@Service("SelectBugInfoimp")
public class SelectBugInfoimp  implements  SelectBugInfoService {

	@Autowired
	private  Bug bug;
	
	public int total(int pid){
		
  return 		bug.allBugNumber(pid);
	}

	@Override
	public List<Map<String, Object>> activeBug(int pid,String currpage,String  everycount) {
		return	bug.activeBug(pid,currpage,everycount);
	 
	}

	@Override
	public int activeBugNumber(int pid) {
		
		return bug.activeBugNumber(pid);
	}

	@Override
	public int waitBugNumber(int pid) {
		
		return bug.waitBugNumber(pid);
	}

	@Override
	public int refuseBugNumber(int pid) {
		return bug.refuseBugNumber(pid);
	}

	@Override
	public int doneBugNumber(int pid) {
		return bug.doneBugNumber(pid);
	}

	@Override
	public int pushBugNumber(int pid) {
		return bug.pushBugNumber(pid);
	}

	@Override
	public int closeBugNumber(int pid) {
		return bug.closeBugNumber(pid);
	}

	@Override
	public int member(int pid) {
	
		return bug.member(pid);
	}

	@Override
	public int produce(int pid) {
	
		return bug.produce(pid);
	}
	
	public  long day(int pid) throws ParseException{
          String old = bug.day(pid);
          SimpleDateFormat  fd =new SimpleDateFormat("yyyy-MM-dd");     
          Calendar  syste =Calendar.getInstance(),olddate=Calendar.getInstance();
          syste.setTime(new Date());
          olddate.setTime( fd.parse(old));
          long systime=syste.getTimeInMillis();
          long oldday=olddate.getTimeInMillis();
          long days = (systime-oldday)/(60*1000*60*24);
          return days;
	}
	
	
	public List<Map<String,Object>> notify(int pid){
		return 	bug.notify(pid);
	}
	
	public int notState(int pid) {
		
		return bug.notState(pid);
	}
	
	
	public int task(int pid){
		
		return bug.task(pid);
	}
	
	public int need(int  pid){
        return  bug.need(pid);
	}
	
	
	public int type1(int pid){
	return 	bug.type1(pid);
		
	}
	
	public int type2(int pid){
	return 	bug.type2(pid);
		
	}
	
	public int type3(int pid){
	return 	bug.type3(pid);
		
	}
	
	public int type4(int pid){
	return 	bug.type4(pid);
		
	}
}