package dao;

import java.util.ArrayList;

import dto.Product;
// 상품 정보를 저장하거나 가져오기 위한 데이터 타입인 Product 클래스를 이용하여 데이터를 조작하기 위한 클래스
public class ProductRepository {

//	ArrayList 적고, 마우스 갖다대서 import 해주기
//	ArrayList 자바프로그래밍 입문 409p에 나옴
	
//	<Product> 적고, 마우스 갖다대서 import 해주기 - 다른 패키지에 있어서 import 해줘야한다.
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
//	보통 static 하면 외부에서 접근해서 전체적으로 사용하려고 한다.
//	그런데 private 붙여서 private static 을 해주면, 싱글톤 패턴으로 사용하는 것임.
//	싱글톤 : 프로그램 상에서 단 하나의 객체만 생성하여 모두 공유하여 사용하는 방식, private 접근제한자를 사용하여 외부에서는 해당 클래스의 객체를 생성할 수 없도록 하고, 내부에서 해당 클래스의 객체를 생성하고 static으로 정적 멤버로 선언한 후 getter를 통해서 내부에서 선언된 객체만 공유하여 사용하는 방법
	private static ProductRepository instance = new ProductRepository();
	
//	위에서 만든 ProductRepository 클래스 타입의 객체가 생성된다. 그런데 private 이라서 직접 접근은 못하고, static이라서 공유는 해놨다. 그래서 아래에서 static을 붙여서 static은 static 붙은 정적멤버끼리만 사용할 수 있으니까, 미리 만든 instance를 사용할 수 있다. 
//	싱글톤 방식으로 생성된 ProductRepository 객체 instance를 공유
	public static ProductRepository getInstance() {
		return instance;
	}
	
//	매개변수를 Product 클래스 타입인 배열을 생성해서 값을 추가 한다.
//	상품 목록에 데이터를 추가
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
	public ProductRepository() {
		Product phone = new Product("p1234", "iPhone6s", 800000);
		phone.setDescription("4.7-inch, 1334x750 Renia HD display, 8-megapixel iSight Camera");
		phone.setCategory("smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("p1235", "LG PC그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LEF display, 5rd Generation Intel core processors");
		notebook.setCategory("NoteBook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refublished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("p1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8 * 125.6 * 6.6mm, Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
//	getAllProducts() 하면 DB에 저장된 모든 데이터를 가져오기
//	반환값이 ArrayList 배열형태임. 전체 다 가져옴. 
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
		
		
//		Java에서 데이터 처리를 쉽게 하기 위해서 미리 만들어 놓은 자료 구조를 컬렉션 프레임워크라고 함.
//		컬렉션은 크게 두 가지로 나누어짐. (Collection, Map)
//		Collection은 자바스크립트의 배열과 비슷한 방식
//		->ArrayList를 가장 많이 사용
//		Map은 자바스크립트의 object와 비슷한 방식
//		->HashMap을 가장 많이 사용
		
//		ArrayList : 기존의 Array(배열)과 비슷하지만 동적으로 크기를 변경할 수 있는 데이터 타입
//		add(데이터) : ArrayList 객체에 데이터 저장
//		remove(index) : ArrayList 객체에서 지정한 idex의 데이터 삭제. 완전 삭제 됨. 칸이 삭제됨.
//		set(index, 데이터) : ArrayList 객체에서 지정한 index의 데이터를 수정
//		get(index, 데이터) : ArrayList 객체에서 지정한 index의 데이터를 가져오기
//		size() : ArrayList 객체에 저장된 데이터 갯수 반환
//		clear() : ArrayList 객체에 저장된 모든 데이터 삭제0
		
//		List는 여러 개의 칸을 만들어서 이어 놓은 것,
//		배열은 하나의 큰 칸을 여러 개의 칸으로 쪼개 놓은 것
//		만약 List와 배열에서 각각 3번 index를 안 쓰고 싶을 때.
//		List : 3번의 칸을 지우고 2번고 4번을 이어주면 된다.
//		배열 : 3번의 칸을 지울 수 없으니 그냥 비워둘 수 밖에 없다. 
		
//		ArrayList 사용방법은 아래와 같이 하나로 고정돼있다.
//		ArrayList<String> list1 = new ArrayList<String>();


//		그냥 배열 사용방법은 아래와 같이 두 가지가 있다.
//		String[] arr = {"qwe", "asd", "zxc"};
//		String[] arr1 = new arr1[];
	}
	
//	DB에 저장된 데이터 중 productId가 같은 데이터를 가져오기
//	데이터 단 한개만 들고 오면 되기 때문에 반환타입을 Product 클래스 타입으로 설정했다. 그러면 클래스 타입의 변수가 있다고 하면, 그 안에 있는 하나의 상품명과 하나의 상품에 대한 모든 정보가 들어 있을 것이다. 
	public Product getProductById(String productId) {
//		Product 클래스 타입의 변수를 미리 선언, 일단 null로 넣어서 빈 변수로 둠. 메모리 공간만 잡아둠.
		Product productById = null;
		
//		원래는 for로 돌릴 필요가 없는데, 실제로 DB가 없으니까 DB흉내낸다고 만들어놓음. 
//		DB의 크기 만큼 for문을 사용하여 DB 전체의 데이터 중 상품id와 동일한 정보를 찾음
		for (int i= 0; i< listOfProducts.size(); i++) {
//			.get을 하면 해당 인덱스에 있는 것 한 개 들고 나오는 것임. Arraylist의 기능. 추가할 때는 add, 삭제할 때는 remove, 수정할 때는 set..
//			listOfProduct에 저장된 상품정보를 하나씩 꺼내어 Product클래스 타입의 변수 product에 대입함
			Product product = listOfProducts.get(i);

//			비교 3번
//			prodcut 객체가 null 이 아니고,
//			product 객체가 가지고 있는 상품id가 null이 아니며, 
//			product 객체가 가지고 있는 상품id와 매개변수로 받아온 상품id가 모두 동일한지 비교.
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
//				product 객체를 for 문 외부에 있는 Product 클래스 타입의 변수 productById에 대입함.
				productById = product;
				break; // for 문 중지
			}
		}
		
		return productById; // for 문에서 받아온 productById를 리턴시킴. 그냥 for 문 안에서 바로 리턴 시켜도 된다. for문 안에 productById = product;와 break; 삭제하고, return product; 해줘도 된다
		}
}










