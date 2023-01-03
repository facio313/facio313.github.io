자바에서는 메서드를 호출할 때 call by value를 사용한다.

call by value는 값만 복사해서 매개인자로 넘기는 것으로 호출한 곳에서 갖고 있는 변수에는 영향을 끼치지 않는다.

```
public class CallByReference {
	public static void main(String[] args) {
		CallByReference c = new CallByReference();
		c.method1();
	}
	
	public void method1() {
		String a = "A";
		String b = "B";
		System.out.println("before" + a + ", " + b );
		method2(a, b);
		System.out.println("after" + a + ", " + b);
	}
	
	public void method2(String a, String b) {
		a = "C";
		b = "D";
	}
}

// beforeA, B
// afterA, B
```

여기서 볼 때, method2의 실행으로 sysout에서 after의 a, b값이 바꼈을 것 같지만 실제로 찍히는 것은 바뀌지 않는다. 즉 call by value로 값만 복사해서 넣어준다는 것이다. 이것은 호출자인 method1이 갖는 변수를 호출 당한 method2에게 넘겼음에도 method1이 갖고 있는 변수에는 영향을 끼치지 않는다. 기본형은 sta하지만 실제로 자바에서는 call by reference를 쓸 수 없다.

자바에서는 메서드 호출이 이루어질 때 각각의 argument 는 그게 value 이거나 reference든 그 여부에 상관 없이 각각의 복사본을 스택 메모리에 생성 한 뒤에 이걸 해당 메서드에 전달 합니다.

primitive 타입이라면 간단하게 그 값(value)이 stack memory에 복사되고 callee 메서드에 그대로 전달됩니다.

그 외에 경우에는 스택메모리의 reference는 힙 메모리상의 실제 데이터를 가리키고 있는데요, callee 메서드에 객체를 전달 할 때에는 스택메모리에 있는 레퍼런스의 복사본이 생성되고, 그 복사본이 메서드로 전달됩니다. 