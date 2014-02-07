package storage;

public class Timenode {
	private int id;
	private int time_weight;
	private String time_description;
	private int time_owner;
	private String display;
	
	public Timenode()
	{
		display = "true";
	}
	public Timenode(int t_weight,String t_description,int owner)
	{
		time_weight = t_weight;
		time_description = t_description;
		time_owner = owner;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTime_weight() {
		return time_weight;
	}
	public void setTime_weight(int time_weight) {
		this.time_weight = time_weight;
	}
	public String getTime_description() {
		return time_description;
	}
	public void setTime_description(String time_description) {
		this.time_description = time_description;
	}
	public int getTime_owner() {
		return time_owner;
	}
	public void setTime_owner(int time_owner) {
		this.time_owner = time_owner;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	
	
}
