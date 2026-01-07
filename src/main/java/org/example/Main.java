package org.example;

import java.util.Scanner;

//TIP 코드를 <b>실행</b>하려면 <shortcut actionId="Run"/>을(를) 누르거나
// 에디터 여백에 있는 <icon src="AllIcons.Actions.Execute"/> 아이콘을 클릭하세요.
public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("=== Java Docker Calculator ===");
        System.out.print("첫 번째 정수를 입력하세요: ");
        int a = sc.nextInt();

        System.out.print("두 번째 정수를 입력하세요: ");
        int b = sc.nextInt();

        System.out.println("\n--- 결과 ---");
        System.out.printf("%d + %d = %d\n", a, b, (a + b));
        System.out.printf("%d - %d = %d\n", a, b, (a - b));
        System.out.printf("%d * %d = %d\n", a, b, (a * b));

        if (b != 0) {
            System.out.printf("%d / %d = %d\n", a, b, (a / b));
        } else {
            System.out.println("나눗셈: 0으로 나눌 수 없습니다.");
        }

        sc.close();

    }
}