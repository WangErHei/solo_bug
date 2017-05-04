package bug.frontstage.login.service;

import java.util.List;
import java.util.Map;

public interface SelectProgramService {
  public  List<Map<String,Object>> selectAllProgram(int bid);
}
