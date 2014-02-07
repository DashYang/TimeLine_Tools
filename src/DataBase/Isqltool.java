package DataBase;

import java.util.*;
public interface Isqltool {
	public boolean add(Object item);
	public boolean update(Object item);
	public boolean delete(Object item);
	public ArrayList<Object> show(int id);
}
