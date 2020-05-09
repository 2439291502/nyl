/*package com.pxxy.handleMenuscript.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.Admin;
import com.pxxy.handleMenuscript.bean.Classify;
import com.pxxy.handleMenuscript.bean.Merchant;
import com.pxxy.handleMenuscript.bean.Product;
import com.pxxy.handleMenuscript.bean.User;
import com.pxxy.handleMenuscript.mapper.AdminMapper;
import com.pxxy.handleMenuscript.mapper.MerchantMapper;
import com.pxxy.handleMenuscript.mapper.OrderMapper;
import com.pxxy.handleMenuscript.mapper.ProductMapper;
import com.pxxy.handleMenuscript.mapper.QuoteMapper;
import com.pxxy.handleMenuscript.mapper.UserMapper;
import com.pxxy.handleMenuscript.service.AdminService;
import com.pxxy.handleMenuscript.service.IOrderService;
import com.pxxy.handleMenuscript.service.IQuoteService;
import com.pxxy.handleMenuscript.service.MerchantService;
import com.pxxy.handleMenuscript.service.OrderService;
import com.pxxy.handleMenuscript.service.ProductService;
import com.pxxy.handleMenuscript.service.QuoteService;
import com.pxxy.handleMenuscript.service.UserService;
	@RunWith(SpringRunner.class)
	@ContextConfiguration({
		"classpath:application-dao.xml",
		"classpath:application-service.xml"
		})
	public class TestAllProject {
		@Autowired
		private ProductService productService;
		
		@Autowired
		private ProductMapper productMapper;
		
		@Autowired
		private OrderService orderService;
		@Autowired
		private OrderMapper orderMapper;
		@Autowired
		private QuoteService quoteService;
		@Autowired
		private QuoteMapper quoteMapper;
		@Autowired
		private UserMapper userMapper;
		@Autowired
		private UserService userService;
		@Autowired
		private MerchantService merchantService;
		@Autowired
		private MerchantMapper merchantMapper;
		@Autowired
		private AdminMapper adminMapper;
		@Autowired
		private AdminService adminService;
	*//**
    * 瀹㈡埛涓嬭鍗�
    *//*
	@Test
	public void testMakeOrder() {
		User user=new User();
		user.setUid(2);
		user.setuRealname("绔犳晱楂�");
		user.setuAddress("姹熻タ鐪佹姎宸炲競");
		user.setuPhone("15216270716");
		String mids="12345,123";
		String odemand="鎴戦渶瑕佺豢鍖栧悗闄�";
		orderService.makeOrder(user, mids, odemand);
	}
	*//**
	 * 瀹㈡埛鏌ョ湅鏈彁浜よ鍗�
	 *//*
	@Test
	public void testFindNoOrder() {
		User user=new User();
		user.setUid(2);
		System.out.println(orderService.seeNoOrder(user).size());
		System.out.println(orderService.seeNoOrder(user));
	}
	*//**
	 * 鎻愪緵鍟嗘煡鐪嬭鎶ヤ环鐨勭敤鎴�
	 *//*
	@Test
	public void testPrepareQuote() {
		Merchant merchant=new Merchant();
		merchant.setMid(12345);
		List list =new ArrayList();
		System.out.println(quoteService.prepareQuote(merchant,list).size());
		System.out.println(quoteService.prepareQuote(merchant,list));
	}
	*//**
	 * 鎻愪緵鍟嗘寚瀹氬鎴锋姤浠�
	 *//*
	@Test
	public void testGoQuote() {
		Merchant merchant=new Merchant();
		merchant.setMid(12345);
		List list =new ArrayList();
		list.add("91447");
		list.add("97443");
		System.out.println(list);
		System.out.println(quoteService .goQuote(merchant,list));
	}
	*//**
	 * 閫氳繃鍟嗗搧鍚嶆煡璇㈠晢鍝�
	 *//*
	@Test
	public void testPname() {
		String pname="闆澗";
		System.out.println(productMapper.findBypanmes(pname));
	}
	*//**
	 * 瀹㈡埛鏌ョ湅寰呯‘瀹氳鍗�
	 *//*
	@Test
	public void testWaitOrder() {
		User user=new User();
		user.setUid(2);
		System.out.println(orderService.waitOrder(user,"wait"));
	}
	*//**
	 * 瀹㈡埛鏌ョ湅鎶ヤ环璇︽儏
	 *//*
	@Test
	public void testDetailOrder() {
		
		System.out.println(productService.findProductByOid("15"));
	}
	*//**
	 * 瀹㈡埛澶勭悊璁㈠崟
	 *//*
	@Test
	public void testConfirmOrder() {
		
		quoteService.confirmOrder("15","receive");
	}
	*//**
	 * 閫氳繃uid鎵句緵搴斿晢
	 *//*
	@Test
	public void selectByMid() {
			User user=new User();
			user.setUid(21);
			System.out.println(userService.selectByMid(user));
	}
	*//**
	 * 閫氳繃oid鏌ユ壘mid
	 *//*
	@Test
	public void selectFindMid() {

			System.out.println(quoteMapper.findMid(123));
	}
	*//**
	 * 閫氳繃mid鏌ユ壘turnover
	 *//*
	@Test
	public void selectFindTurnover() {

		System.out.println(merchantMapper.findTurnover(1));
}
	*//**
	 * /**
	 * 閫氳繃mid鏇存敼turnover
	 *//*
	@Test
	public void selectUpdateTurnover() {

		merchantMapper.updateTurnover(2, 1);
}
	*//**
	 * 閫氳繃uid鏌ユ壘mid
	 *//*
	@Test
	public void selectFindByUid() {

		System.out.println(merchantMapper.findByUid(22));
}
	*//**
	 * 閫氳繃鐘舵�佹煡瀹㈡埛鍜屾彁渚涘晢淇℃伅
	 *//*
	@Test
	public void selectFindByState() {

		System.out.println(userService.findByState());
}	
	===========================鑱傜帀鐜�==========================
	*//**
	 * 閫氳繃鐢ㄦ埛鍚嶆煡璇㈢敤鎴锋煡涓ゆ潯璁板綍
	 *//*
	@Test
	public void findAllProduct() {
		PageInfo<Product> list=productService.findAllProduct(1, 2);
		System.out.println(list.getList());
		System.out.println(list);
	}
	@Test
	public void findProductByCids() {
		List<Product> list=productService.findProductByCid(1);
		System.out.println(list);
	}
	*//**
	 * 閫氳繃鐢ㄦ埛鍚嶆煡璇㈢敤鎴�
	 *//*
	@Test
	public void selectUserByUsername() {
		System.out.println(userService.checkUserByPhone("15216270716"));
		
	}
	@Test
	public void selectUserByUsernameServcie() throws Exception {
		try {
			User user=new User();
			user.setUsername("123756");
			userService.register(user);
			System.out.println(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println(e.getMessage());e.printStackTrace();
		}
	}
	*//**
	 * 娣诲姞鐢ㄦ埛
	 *//*
	@Test
	public void insertUser() {
		ClassPathXmlApplicationContext ac=new ClassPathXmlApplicationContext("application-dao.xml");
		UserMapper um=ac.getBean("userMapper", UserMapper.class);
		User user=new User();
		user.setUsername("nieyuling");
		user.setPassword("123");
		user.setuRealname("鑱傜帀鐜�");
		user.setuAddress("钀嶄埂瀛﹂櫌");
		user.setuPhone("13207059785");
		user.setuStatus(1);
		user.setuLevel(1);
		user.setuCreatetime(new Date());
		user.setuCreateuser("nieyuling");
		user.setRid(1);
		um.insertUser(user);
	}
	==============================楂橀==============
	*//**
	 * 閫氳繃鐢ㄦ埛鍚嶆煡涓汉淇℃伅
	 *//*
	@Test
	public void testSelectUserByUsername() {
		System.out.println(userMapper.selectUserByUsername("caonima"));
	}
	
	*//**
	 * 閫氳繃uid淇敼鐢ㄦ埛
	 *//*
	@Test
	public void updateUser() {
		User user= new User();
    	user.setUid(25);
      	user.setUsername("chousb");
    	user.setPassword("55555");
    	user.setuRealname("楂橀");
    	user.setuAddress("缇庡浗");
    	user.setuStatus(1);
    	user.setuLevel(2);
    	user.setMid(2);
    	user.setRid(2);
    	user.setuPhone("158793938");
        user.setuCreatetime(new Date());
        user.setuUpdatetime(new Date());
        user.setuCreateuser("gaofei");
        user.setuUpdateuser("gaofei");  
        userMapper.updateUser(user);
	}
*//**
	* 淇濆瓨鐢ㄦ埛
	 *//* 
	@Test
	public void saveUser() {
		User user= new User();
      	user.setUsername("caonima");
    	user.setuRealname("楂橀");
    	user.setuAddress("閯遍槼");
    	user.setuStatus(1);
    	user.setuLevel(2);
    	user.setuPhone("158793938");
        user.setuCreatetime(new Date());
      
        userMapper.saveUser(user);
	}
	*//**
	 * 鎵归噺鍒犻櫎涓汉淇℃伅
	 *//*
	@Test
     public void deleteUser() {
    		Integer[] ids1 = {11,12};
    		userMapper.deleteUser(ids1);
    	 
     }
     *//**
 	 * 閫氳繃瀹炲悕鏌ヤ釜浜轰俊鎭�
 	 *//*
	@Test
     public void findByName() {
         List<User> users= userMapper.findByName("楂橀");
         for(User user:users) {
    		   System.out.println(user);
    	   }
}  
     *//**
 	 * 鏌ヨ涓�鍏卞灏戞潯淇℃伅
 	 *//*
	@Test
     public void findTotal(){
         int count =userMapper.findTotal();
         System.out.println(count);
  }
     public void findTotalByName(){
         int count =userMapper.findTotalByName("楂橀");
         System.out.println(count);
  }
     
     
     *//**
 	 * 鎵归噺鍐荤粨鐢ㄦ埛
 	 *//*
     @Test
     public void dongJieUser() {
 		Integer[] ids = {1};
 		userMapper.dongJieUser(ids); 
    	 
     }
     ===========================李教文==========================
     @Test
 	public void testSelectAdminByAid() {
 		System.out.println(adminService.selectAdminByAid(1));
 	}
     @Test
 	public void testSelectUserByname() {
 		System.out.println(adminMapper.selectAdminByAname("888888"));
 	}
   
     @Test
 	public void testupdateAdmin1() {
 		Admin admin=new Admin();
 		admin.setAid(1);
 		admin.setaUpdatetime(new Date());
 		adminService.changAdmin(admin);
 	}
 	
     @Test
 	public void removeAdmin() {
 		adminService.removeAdmin("1");
 	}
     @Test
 	public void addAdmin() {
 		Admin admin=new Admin();
 		admin.setAname("8");
 		admin.setApassword("99");
 		admin.setaCreatetime(new Date());
 		adminService.addAdmin(admin);
 	}
     @Test
 	public void selectAll() {
 		PageInfo<Admin> allAdmin = adminService.selectAll(1, 2);
 		System.out.println(allAdmin);
 		}
 	
 	@Test
 	public void selectDealConcludedOrder() {
 		System.out.println(orderMapper.selectDealConcludedOrder(1));
 	}
 	*//**
	 * 1查询所有产品ok
	 *//*
	@Test
	public void findAllProducts() {
		List<Product> productList=productMapper.findAllProduct();
		System.out.println(productList.size());
		
	}
	@Test
	public void findProductOrderByPriceAsc() {
		List<Product> productList=productMapper.findProductOrderByPriceAsc("6",0,9999);
		System.out.println(productList);
		System.out.println(productList.size());
		
	}
	
	*//**
	 * 2多条件查询产品ok
	 *//*
	@Test
	public void findProductByCriterias() {
		Product product=new Product();
		product.setPname("3");
		product.setMinprice(100.f);
		product.setMaxprice(2000.f);
		List<Product> productList=productMapper.findProductByCriterias(product);
		System.out.println(productList.size());

		for(int i=0;i<productList.size();i++) {
			System.out.println(productList.get(i).getPname()+"........"+productList.get(i).getpPrice());
			System.out.println();
			System.out.println();
			
		}
		
		
	}
	
	*//**
	 * 3查询所有分类ok
	 *//*
	@Test
	public void findAllClassify() {
		List<Classify> classifyList=productMapper.findAllClassify();
		System.out.println(classifyList);
	}
	*//**
	 * 4通过分类cid查询商品OK
	 *//*
	@Test
	public void findProductByCid() {
//		productService.findAllClassify(1, 2);	
		List<Classify> list=productMapper.findAllClassify();
		PageInfo<Classify> result=new PageInfo<>(list);
		System.out.println(result+"");
		System.out.println(list.size());

	}
	*//**
	 * 5查询所有分类下产品所有分类及该分类下的所有产品
	 *//*
	@Test
	public void findClassifyAndProduct1() {
		List<Classify> classify=productMapper.findClassifyAndProduct();
		for(int i=0;i<classify.size();i++) {
//			System.out.println(classify.get(i).getCname());
			System.out.println(classify.get(i).getProductList().get(i).getPid());
		}
		System.out.println(classify.size());
	}
	*//**
	 * 6通过产品pid查询商品ok
	 *//*
	@Test
	public void findProductByPid() {
		Product product=productMapper.findProductByPid(9);
		System.out.println(product);
	}
	*//**
	 *  7通过pid删除商品ok
	 *//*
	@Test
	public void delectProductByPid() {
		productMapper.delectProductByPid(9);
		
	}
	
	
	
	*//**
	 * 有問題findClassifyAndProduct
	 *//*
	@Test
	public void findClassifyAndProduct() {
		List<Classify> classifyList=productMapper.findAllClassify();
		System.out.println("classifyList.get(0).getCname():"+classifyList.get(0).getCname());
		System.out.println("classifyList.get(0).getCid():"+classifyList.get(0).getCid());
		MultiValueMap<String,Product> Lproduct=new LinkedMultiValueMap<String,Product>();
		
		for(int i=0;i<classifyList.size();i++) {
			
			List<Product> productList=productMapper.findProductByCid(classifyList.get(i).getCid());
			System.out.println("productList.size():"+productList.size());
			for(int j=0;j<productList.size();j++) {
				
			if(Lproduct.containsKey(productList.get(j).getClassify().getCname())) {

				Lproduct.get(productList.get(j).getClassify().getCname()).add(productList.get(j));
			}
			else {
				List<Product> list=productMapper.findProductByCid(classifyList.get(i).getCid());
				Lproduct.set(list.get(j).getClassify().getCname(), list.get(j));
			}
			}
			System.out.println("Lproduct"+Lproduct);
		}
			
	
	}
	*//**
	 * 8 通过pid更新产品信息
	 *//*
	@Test
	public void editProductByPid() {
		Product product=new Product();
		product.setPid(12);
		product.setCid(3);
		product.setPname("树888888");
		product.setpDetail("这是棵树xiugaideshu");
		product.setpDetail("耐寒，耐旱");
		product.setpImage("/treeImage1");
		productService.editProduct(product);
	
	
	}
	*//**
	 * <!-- 9添加产品 -->
	 *//*
	@Test
	public void insertProduct() {
		Product product=new Product();
		product.setPid(1);
		product.setCid(3);
		product.setPname("树1111");
		product.setpDetail("这是棵树xiugaideshu");
		product.setpDetail("耐寒，耐旱");
		product.setpImage("/treeImage1");
		productService.addProduct(product);
		
	}
	
	@Test
	public void findProductByPname() {
			List<Product> productList=productMapper.findProductByPname("1");
			System.out.println(productList.size());
			System.out.println(productList);
		
	}
	@Test
	public void findMerchantWaitOrder() {
			System.out.println(orderMapper.findMerchantWaitOrder(12359, "2"));
			
		
	}
	@Test
	public void findQuote() {
			System.out.println(orderMapper.findQuote());
			
		
	}
	@Test
	public void findAllProductPage() {
		
		PageHelper.startPage(1, 4);
		List<Product> list=productMapper.findAllProduct();
		PageInfo<Product> result=new PageInfo<>(list);
		System.out.println(result);
	}
	@Test
	public void find() {
		
		System.out.println(orderService.quote());
	}
	@Test
	public void completeQuote() {
		Merchant merchent=new Merchant();
		merchent.setMid(12366);
		System.out.println(quoteMapper.completeQuote(merchent));
	}

}*/