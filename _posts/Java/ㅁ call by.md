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

여기서 볼 때, method2의 실행으로 sysout에서 after의 a, b값이 바꼈을 것 같지만 실제로 찍히는 것은 바뀌지 않는다. 즉 call by value로 값만 복사해서 넣어준다는 것이다. 이것은 호출자인 method1이 갖는 변수를 호출 당한 method2에게 넘겼음에도 method1이 갖고 있는 변수에는 영향을 끼치지 않는다. 기본형은 stack에 변수와 값을 같이 저장하고 넘길 때 그것의 복사본을 넘기는 것이다. a와 b를 넘겼지만, 넘어간 것은 "A"와 "B"이고, 넘어간 "A"는 method2의 a로, "B"는 method2의 b가 되는데, 이때 a와 b는 처음 넘겨진 a, b와는 다른 것이다. 반복해서 말하지만 쉽게 말해서
method1 a     b
method2 a(a') b(b')
인 것이다.
그래서 method2에서 a를 C로, b를 D로 바꿔도 method2의 a는 a'이니 method1의 a와는 다르다. 그래서 a'인 a를 바꾸는 것은 a인 a에 아무런 영향이 없다.

하지만 참조 타입의 경우는 변수와 주소값을 stack에 저장하고 객체는 heap에 저장한다. 이때 매개변수로 넘겨주는 것은 주소값이다. 주소값을 복사하더라도 그건 고유한 주소값이다. 그래서 넘겨진 주소값을 넘기면 동일한 객체를 참고하여 변하게 된다. 객체를 생성하면 heap에 만들어지고 그것을 선언한 변수에 할당하게 되면 변수와 할당한 주소값을 stack에 저장된다. 이때 참조 변수를 넘기는 것은 참조 타입 객체의 주소값을 넘긴다는 것, 주소값은 복사되어도 같은 주소값이고 같은 주소값은 heap의 같은 객체를 가리킨다.
자바에서는 메서드 호출이 이루어질 때 각각의 argument 는 그게 value 이거나 reference든 그 여부에 상관 없이 각각의 복사본을 스택 메모리에 생성 한 뒤에 이걸 해당 메서드에 전달 합니다.

primitive 타입이라면 간단하게 그 값(value)이 stack memory에 복사되고 callee 메서드에 그대로 전달됩니다.

그 외에 경우에는 스택메모리의 reference는 힙 메모리상의 실제 데이터를 가리키고 있는데요, callee 메서드에 객체를 전달 할 때에는 스택메모리에 있는 레퍼런스의 복사본이 생성되고, 그 복사본이 메서드로 전달됩니다. 