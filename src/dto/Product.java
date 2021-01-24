package dto;

import java.io.Serializable;
//	class 생성 시 interfaece 부분에 Serializable 검색 후 넣어주면, import 부분도 자동으로 넣어준다.
//	자바 빈즈 생성 규칙
//	1. Serializable 인터페이스 상속 구현
//	2. 멤버 변수의 접근제한자를 private으로 사용
//	3. 멤버 변수에 모두 getter/setter 적용
//	4. 기본 생성자가 반드시 존재

//	데이터 베이스에서 데이터를 저장하거나 가져올 때 사용하는 데이터 타입을, 클래스를 통해서 규격화함
//	자바의 배열은 동일한 데이터 타입끼리 사용가능함
//	그러나 클래스만 두고 보면, 메서드를 빼고 보면 여러 가지 데이터 타입끼리 모여있는 멤버 변수들로 모여 있다. 그래서 우리는 클래스를 하나 만들어서 이렇게 여러 가지 데이터 타입이 모인 멤버 변수를 넣어서, 클래스를 하나의 데이터 타입화 해서 사용한다. 배열처럼... 그런 조작을 ProductRepository 부분에서 해준다. 이 파일은 데이터 타입으로만 사용하고.
public class Product implements Serializable {
	private final static long serialVersionUID = -4274700572038677000L;
	
//	아래와 같이 주석을 달아주면, 나중에 찾아보기 쉽다.
	private String productId;		// 상품 아이디
	private String pname;			// 상품

	private Integer unitPrice;		// 상품 가격
	private String description;		// 상품 설명
	private String manufacturer;	// 제조자
	private String category;		// 분류
	private long unitsInStock;		// 재고 수
	private String condition;		// 신상품/중고품/재생품
	

	public String getProductId() {
		return productId;
	}
//		alt + shift + s 단축키 눌러서 나오는 것 중에 generate getter/setter 로 생성해줬다.
		public void setProductId(String productId) {
			this.productId = productId;
		}

		public String getPname() {
			return pname;
		}

		public void setPname(String pname) {
			this.pname = pname;
		}

		public Integer getUnitPrice() {
			return unitPrice;
		}

		public void setUnitPrice(Integer unitPrice) {
			this.unitPrice = unitPrice;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getManufacturer() {
			return manufacturer;
		}

		public void setManufacturer(String manufacturer) {
			this.manufacturer = manufacturer;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public long getUnitsInStock() {
			return unitsInStock;
		}

		public void setUnitsInStock(long unitsInStock) {
			this.unitsInStock = unitsInStock;
		}

		public String getCondition() {
			return condition;
		}

		public void setCondition(String condition) {
			this.condition = condition;
		}


		
//		기본 생성자
		public Product() {
			super();
		}
		
		public Product(String productId, String pname, Integer unitPrice) {
			this.productId = productId;
			this.pname = pname;
			this.unitPrice = unitPrice;
		}
}
