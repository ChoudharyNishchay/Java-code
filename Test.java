
class Test {

	public int num = 10;

	public int addtwo() {
		num = num + 2;
		return num;

	}

	public int addfour() {
		num = num + 4;
		return num;

	}

	public static void main(String[] args) {
		Test t = new Test();
t.num=t.addtwo()+t.addfour();
System.out.println(t.addfour());
	}
}
