package bug.frontstage.project_info.service;

import java.util.List;
import java.util.Map;

public interface ProgramService {
	 public  List<Map<String,Object>> selectAllProgram(int bid);
	 public  List<Map<String,Object>> selectAllMember(int pid);
}
