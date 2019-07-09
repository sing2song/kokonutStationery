package order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cart.bean.CartDTO;
import cart.dao.CartDAO;
import goods.bean.GoodsDTO;
import order.bean.OrderDTO;
import order.bean.OrderlistDTO;
import order.bean.PostDTO;
import order.dao.OrderDAO;
import point.bean.PointDTO;
import user.bean.UserDTO;
import user.dao.UserDAO;

@Controller
@RequestMapping(value="/order/*")
public class OrderController {
	
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CartDAO cartDAO;
		
	//상세페이지에서 구매하기 버튼 클릭 : 옵션 없는 제품의 order페이지 
	//제품1개에 대한 정보
	@GetMapping("/orderNoOption.do")
	public ModelAndView orderNoOption(@RequestParam int productCode
									,@RequestParam int productQty
									,HttpSession session) {
		//세션아이디
		String userId = (String) session.getAttribute("memId");
		//제품정보가져오기
		GoodsDTO goodsDTO = orderDAO.getProduct(productCode);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("productQty", productQty);
		mav.addObject("goodsDTO", goodsDTO);
		//유저정보가져오기
		if(userId!=null) {
			UserDTO userDTO = userDAO.getUserInfo(userId);	
			mav.addObject("userDTO", userDTO);
		}else {
			int seq = userDAO.IncreaseKokonutSeq();
			userDAO.createKokonutId(seq);
			UserDTO userDTO = userDAO.getKokonutId(seq);
			session.setAttribute("kokonutId", userDTO.getUserId());
			mav.addObject("userDTO", userDTO);
		}
		mav.addObject("display", "/order/order.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//상세페이지에서 구매하기 버튼 클릭 : 옵션 있는 제품의 order페이지
	//제품 1개에 대한 정보
	@GetMapping("/orderOption.do")
	public ModelAndView orderOption(@RequestParam int productCode
								,@RequestParam String[] selArray
								,@RequestParam int[] productQtyArray
								,HttpSession session) {
		//세션아이디
		String userId = (String) session.getAttribute("memId");
		//제품정보가져오기
		GoodsDTO goodsDTO = orderDAO.getProduct(productCode);
		
		String selValue = "";
		String pdQtyValue = "";
		for(int i = 0; i < selArray.length; i++) {
			selValue += (selArray[i] + ",");
			pdQtyValue += (productQtyArray[i]+ ",");
		}

//		System.out.println(selValue);
//		System.out.println(pdQtyValue);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pdQtyValue", pdQtyValue); //선택한 옵션 
		mav.addObject("selValue", selValue);	 //선택한 옵션의 상품의 수량
		mav.addObject("goodsDTO", goodsDTO);
		//유저정보가져오기
		if(userId!=null) {
			UserDTO userDTO = userDAO.getUserInfo(userId);	
			mav.addObject("userDTO", userDTO);
		}else {
			int seq = userDAO.IncreaseKokonutSeq();
			userDAO.createKokonutId(seq);
			UserDTO userDTO = userDAO.getKokonutId(seq);
			session.setAttribute("kokonutId", userDTO.getUserId());
			mav.addObject("userDTO", userDTO);
		}
		mav.addObject("display", "/order/order.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}

	//배송지 검색 페이지
	@GetMapping("/checkPost.do")
	public String checkPost() {
		return "/order/checkPost";
	}
	
	//배송지 검색
	@RequestMapping(value="/postSearch.do", method=RequestMethod.POST)
	public ModelAndView postSearch(@RequestParam Map<String, String> map) {
		List<PostDTO> list = orderDAO.postSearch(map);	
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	//배송 정보 추가
	@RequestMapping(value="/updateUserInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public String setUserInfo(@ModelAttribute UserDTO userDTO) {
		orderDAO.updateUserInfo(userDTO);
		return "success";
	}
	
	//주문 정보 추가 : 옵션이 없는 경우
	@RequestMapping(value="/setOrderInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public String setOrderInfo(@ModelAttribute OrderDTO orderDTO) {
		int su = orderDAO.setOrderInfo(orderDTO);
		if(su == 1)	return "success";
		else return "fail";
	}
	
	//주문 정보 추가 : 옵션이 있는 경우
	@RequestMapping(value="/setOrderInfoOption.do", method=RequestMethod.POST)
	@ResponseBody
	public String setOrderInfoOption(@ModelAttribute OrderDTO orderDTO) {
		int su = orderDAO.setOrderInfoOption(orderDTO);
		if(su == 1)	return "success";
		else return "fail";
	}

	//order_settle 페이지
	@GetMapping("/order_settle.do")
	public ModelAndView orderSettle(@RequestParam(required=false, defaultValue="0") String usePoint) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("usePoint", usePoint); //사용한 포인트
		mav.addObject("display", "/order/order_settle.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//주문 정보 받아오기
	@RequestMapping(value="/getOrder.do", method=RequestMethod.POST)
	public ModelAndView getOrderList(HttpSession session) {
		String userId = (String) session.getAttribute("memId");
		
		ModelAndView mav = new ModelAndView();
		if(userId!=null) {
			List<OrderDTO> list = orderDAO.getOrderInfo(userId);
			mav.addObject("list", list); 						
		}else {
			userId = (String) session.getAttribute("kokonutId");
			List<OrderDTO> list = orderDAO.getOrderInfo(userId);
			mav.addObject("list", list); 
		}                            //상품정보
		mav.setViewName("jsonView");
		return mav;
	}
	
	//주문자 정보 받아오기
	@RequestMapping(value="/getOrderUserInfo.do",method=RequestMethod.POST)
	public ModelAndView getOrderUserInfo(HttpSession session) {
		
		String userId = (String) session.getAttribute("memId");
		
		ModelAndView mav = new ModelAndView();
		if(userId!=null) {
			UserDTO userDTO = userDAO.getUserInfo(userId);
			mav.addObject("userDTO", userDTO);						//유저정보
		}else {
			userId = (String) session.getAttribute("kokonutId");
			UserDTO userDTO = userDAO.getUserInfo(userId);
			mav.addObject("userDTO", userDTO);
		}
		mav.setViewName("jsonView");
		return mav;
	}
	
	//ORDERLIST 생성 및 ORDER 수정
	@RequestMapping(value="/insertOrderlist.do", method=RequestMethod.POST)
	@ResponseBody
	public String insertOrderlist(@RequestParam Map<String, Object> map) {
		//ORDERLIST 생성
		System.out.println(map);
		int su = orderDAO.insertOrderlist(map);
		if(su == 0) {
			return "fail";
		}
		else {
			return "success";
		}
	}
	
	//재고처리
	@RequestMapping(value="/reduceSaleProduct.do", method=RequestMethod.POST)
	@ResponseBody
	public String reduceSaleProduct(@RequestParam int productCode
			, @RequestParam int purchaseQty, @RequestParam(required=false, defaultValue="noneOption") String optionContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		//System.out.println(optionContent);
		if(optionContent.equals("noneOption")) {//옵션 없음
			map.put("productCode", productCode);
			map.put("purchaseQty", purchaseQty);
			orderDAO.reduceSaleProduct(map);
		}else {// 옵션 있음
			map.put("productCode", productCode);
			map.put("purchaseQty", purchaseQty);
			map.put("optionContent", optionContent);
			orderDAO.reduceSaleProductOption(map);
		}
		
		return "success";
	}
	@RequestMapping(value="/kokonutIdCancel.do", method=RequestMethod.GET)
	@ResponseBody
	public String kokonutIdCancel(@RequestParam String userId) {
		int su = userDAO.kokonutIdCancel(userId);
		
		if(su==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	

	@RequestMapping(value="/orderCancel.do", method=RequestMethod.GET)
	@ResponseBody
	public String orderCancel(@RequestParam String userId) {
		orderDAO.orderCancel(userId);
		
		return "success";
	}

	//주문 정보 추가 : 옵션이 있는 경우
	@RequestMapping(value="/cartOrderInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public String setcartOrderInfo(@ModelAttribute OrderDTO orderDTO) {
		System.out.println(orderDTO);
		int su = orderDAO.setOrderInfoOption(orderDTO);
	
		if(su == 1)	return "success";
		else return "fail";
	}

	//order_cart 페이지 : 장바구니에서 선택주문에서 이동하는 페이지
	@GetMapping("/order_cart.do")
	public ModelAndView orderCart(@RequestParam String checkedValueStr, HttpSession session ) {
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		String[] cartCodeStr = checkedValueStr.split(",");
		int[] cartCode = new int[(cartCodeStr.length)-1];
		for(int i = 0; i<cartCodeStr.length-1; i++) {
			cartCode[i] = Integer.parseInt(cartCodeStr[i]);
			CartDTO cartDTO = cartDAO.getCartDTO(cartCode[i]);
			list.add(cartDTO);
		}
		
		
	 	String thumbImgList = "";
		String productCodeList = "";
		String productNameList = "";
		String discountPriceList = "";
		String purchaseQtyList = "";
		String productOptionList ="";
		String optionContentList = "";
		
		for(int i= 0 ; i<list.size(); i++) {
			thumbImgList += (list.get(i).getThumbImg() + ",");
			productCodeList += (list.get(i).getProductCode() + ",");
			productNameList += (list.get(i).getProductName() + ",");
			discountPriceList += (list.get(i).getDiscountPrice() + ",");
			purchaseQtyList += (list.get(i).getProductQty() + ",");
			productOptionList += (list.get(i).getProductOption() + ",");
			optionContentList += (list.get(i).getOptionContent() + ",");
		}
		System.out.println(thumbImgList);
		System.out.println(productCodeList);
		System.out.println(productNameList);
		System.out.println(discountPriceList);
		System.out.println(purchaseQtyList);
		System.out.println(productOptionList);
		System.out.println(optionContentList);
		
		String userId = (String) session.getAttribute("memId");
		UserDTO userDTO = userDAO.getUserInfo(userId);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("thumbImgList", thumbImgList);
		mav.addObject("productCodeList", productCodeList);
		mav.addObject("productNameList", productNameList);
		mav.addObject("discountPriceList", discountPriceList);
		mav.addObject("purchaseQtyList", purchaseQtyList);
		mav.addObject("productOptionList", productOptionList);
		mav.addObject("optionContentList", optionContentList);
		mav.addObject("userDTO", userDTO);
		mav.addObject("list", list);
		mav.addObject("display", "/order/order_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	

}




