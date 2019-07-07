package ordermanager.dao;

import java.util.List;
import java.util.Map;

import order.bean.OrderDTO;
import order.bean.OrderlistDTO;
import user.bean.UserDTO;

public interface OrderManagerDAO {

	public List<OrderlistDTO> getOrderList();
	
	public UserDTO getReceiverInform(String userId);
	
	public List<OrderDTO> orderViewList(String orderCode);

	public int orderStateChange(Map<String, Object> map);

	

}