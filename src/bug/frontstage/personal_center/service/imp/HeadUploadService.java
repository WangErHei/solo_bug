package bug.frontstage.personal_center.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.personal_center.dao.PersonalDao;

@Service("HeadUploadService")
public class HeadUploadService {

	@Autowired
	private PersonalDao  personalDao;
	
	public void headUpload(int bid,String head){
		personalDao.headUpload(bid, head);
	}
	
	
}
