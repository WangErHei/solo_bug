package bug.frontstage.bug_info.model;

import java.sql.Blob;
import java.util.Date;

public class Bug {

	private int bug_id;
	private String bug_type;
	private String bug_state;
	private String prop;
	private int buser_id;
	private String bug_maker;
	private String bug_signer;
	private Date bug_plan_date;
	private Date bug_create_date;
	private Date bug_repair_date;
	private Date bug_check_date;
	private String bug_plan_version;
	private Date bug_lasted_date;
	private String bug_environment;
	private String bug_effective_version;
	private String bug_title;
	private String bug_describe;
	private int block_id;
	private int produce_id;
	private int program_id;
	private Blob bug_photo;

	public int getBug_id() {
		return bug_id;
	}

	public void setBug_id(int bug_id) {
		this.bug_id = bug_id;
	}

	public String getBug_type() {
		return bug_type;
	}

	public void setBug_type(String bug_type) {
		this.bug_type = bug_type;
	}

	public String getBug_state() {
		return bug_state;
	}

	public void setBug_state(String bug_state) {
		this.bug_state = bug_state;
	}

	public String getProp() {
		return prop;
	}

	public void setProp(String prop) {
		this.prop = prop;
	}

	public int getBuser_id() {
		return buser_id;
	}

	public void setBuser_id(int buser_id) {
		this.buser_id = buser_id;
	}

	public String getBug_maker() {
		return bug_maker;
	}

	public void setBug_maker(String bug_maker) {
		this.bug_maker = bug_maker;
	}

	public String getBug_signer() {
		return bug_signer;
	}

	public void setBug_signer(String bug_signer) {
		this.bug_signer = bug_signer;
	}

	public Date getBug_plan_date() {
		return bug_plan_date;
	}

	public void setBug_plan_date(Date bug_plan_date) {
		this.bug_plan_date = bug_plan_date;
	}

	public Date getBug_create_date() {
		return bug_create_date;
	}

	public void setBug_create_date(Date bug_create_date) {
		this.bug_create_date = bug_create_date;
	}

	public Date getBug_repair_date() {
		return bug_repair_date;
	}

	public void setBug_repair_date(Date bug_repair_date) {
		this.bug_repair_date = bug_repair_date;
	}

	public Date getBug_check_date() {
		return bug_check_date;
	}

	public void setBug_check_date(Date bug_check_date) {
		this.bug_check_date = bug_check_date;
	}

	public String getBug_plan_version() {
		return bug_plan_version;
	}

	public void setBug_plan_version(String bug_plan_version) {
		this.bug_plan_version = bug_plan_version;
	}

	public Date getBug_lasted_date() {
		return bug_lasted_date;
	}

	public void setBug_lasted_date(Date bug_lasted_date) {
		this.bug_lasted_date = bug_lasted_date;
	}

	public String getBug_environment() {
		return bug_environment;
	}

	public void setBug_environment(String bug_environment) {
		this.bug_environment = bug_environment;
	}

	public String getBug_effective_version() {
		return bug_effective_version;
	}

	public void setBug_effective_version(String bug_effective_version) {
		this.bug_effective_version = bug_effective_version;
	}

	public String getBug_title() {
		return bug_title;
	}

	public void setBug_title(String bug_title) {
		this.bug_title = bug_title;
	}

	public String getBug_describe() {
		return bug_describe;
	}

	public void setBug_describe(String bug_describe) {
		this.bug_describe = bug_describe;
	}

	public int getBlock_id() {
		return block_id;
	}

	public void setBlock_id(int block_id) {
		this.block_id = block_id;
	}

	public int getProduce_id() {
		return produce_id;
	}

	public void setProduce_id(int produce_id) {
		this.produce_id = produce_id;
	}

	public int getProgram_id() {
		return program_id;
	}

	public void setProgram_id(int program_id) {
		this.program_id = program_id;
	}

	public Blob getBug_photo() {
		return bug_photo;
	}

	public void setBug_photo(Blob bug_photo) {
		this.bug_photo = bug_photo;
	}

}
