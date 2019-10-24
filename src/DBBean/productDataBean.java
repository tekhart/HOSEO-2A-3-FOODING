package DBBean;

public class productDataBean {
	
	int buyId;
	int cartId;
	
	String owner;
	
	int productId;
	String productName;
	int isTool;
	int productType;
	int price;
	int discountRate;
	String productThumb;
	
	int productCount;
	
	public int getBuyId() {
		return buyId;
	}
	public void setBuyId(int buyId) {
		this.buyId = buyId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getIsTool() {
		return isTool;
	}
	public void setIsTool(int isTool) {
		this.isTool = isTool;
	}
	public int getProductType() {
		return productType;
	}
	public void setProductType(int productType) {
		this.productType = productType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public String getProductThumb() {
		return productThumb;
	}
	public void setProductThumb(String productThumb) {
		this.productThumb = productThumb;
	}
	
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
}
