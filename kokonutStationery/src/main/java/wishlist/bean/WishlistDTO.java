package wishlist.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class WishlistDTO {
	private String userId;
	private int productCode;
	private String productName;
	private int productOption;
	private String optionContent;
	private int discountPrice;
	private String thumbImg;
	private Date logdate;
}
